require 'oauth'
require 'json'

module Tjplurk
  class API
    attr_reader :consumer, :request_token, :access_token

    def self.config_file_path
      ENV['TJPLURK_FILE'] || File.join(ENV['HOME'], '.tjplurk')
    end

    def initialize(consumer_key = nil, consumer_secret = nil, token_key = nil, token_secret = nil)
      if consumer_key.nil? || consumer_secret.nil?
        raise 'Consumer key & secret are not found.' unless File.exist? Tjplurk::API.config_file_path
        consumer_key, consumer_secret, token_key, token_secret = File.readlines(Tjplurk::API.config_file_path).map(&:strip!).delete_if(&:empty?)
      end
      @consumer = OAuth::Consumer.new(consumer_key, consumer_secret, Tjplurk::OAUTH_OPTIONS)
      @access_token = OAuth::AccessToken.new(@consumer, token_key, token_secret) if token_key && token_secret
    end

    def request_token
      @request_token ||= @consumer.get_request_token
    end

    def request path, body = '', headers = {}
      JSON.parse(@access_token.post(path, body, headers).body)
    end

    def real_time
      ret = request('/APP/Realtime/getUserChannel')
      comet_server = ret['comet_server']
      loop do
        uri = URI(comet_server)
        json = JSON.parse(Net::HTTP.get(uri)[/CometChannel.scriptCallback\((.*)\);/m, 1])
        json['data'].each{ |plurk| yield plurk } if json['data']
        comet_server.sub!(/(offset=)\d+/, "\\1#{json['new_offset']}")
      end
    end
  end
end