require 'tjplurk/robot/response'
require 'yaml'

module Tjplurk
  class Robot
    class Topic
      attr_accessor :name, :pattern, :responses
      class << self
        def load yaml
          YAML.load(yaml).map do |attributes|
            topic = self.new name: attributes['name'], pattern: attributes['pattern']
            topic.responses = attributes['responses'].map{|res| Response.new(topic: topic, content: res)}
            topic
          end
        end
      end

      def initialize(**params)
        params.each{|key, value| send("#{key}=", value)}
      end
    end
  end
end