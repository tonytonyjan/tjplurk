require 'launchy'
require 'tjplurk'
require 'thor'

module Tjplurk
  class Cli < Thor
    include Thor::Actions

    desc 'auth CONSUMER_KEY CONSUMER_SECRET', 'get access token interactivly.'
    def auth consumer_key, consumer_secret
      api = Tjplurk::API.new(consumer_key, consumer_secret)
      puts "Authorize URL: #{api.request_token.authorize_url}"
      Launchy.open(api.request_token.authorize_url)
      oauth_verifier = ask 'Enter Verification Number:'
      access_token = api.request_token.get_access_token oauth_verifier: oauth_verifier
      File.open(Tjplurk::API.config_file_path, 'w') do |f|
        f.puts consumer_key
        f.puts consumer_secret
        f.puts access_token.token
        f.puts access_token.secret
      end
      puts "Key & secret successfully saved to \"#{Tjplurk::API.config_file_path}\"."
    end

    desc 'api PATH ["FOO=BAR" ...]', 'send an API request.'
    long_desc <<-LONGDESC
      For example:
      \x5$ tjplurk api /APP/Users/me
      \x5$ tjplurk api /APP/Timeline/plurkAdd "content=hello world" qualifier=says

      For more available paths, see http://www.plurk.com/API'
    LONGDESC
    def api path, *args
      params = Hash[args.map{|arg| arg.split('=')}]
      api = Tjplurk::API.new
      puts api.access_token.post(path, params).body
    end
  end
end