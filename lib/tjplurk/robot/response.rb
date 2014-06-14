module Tjplurk
  class Robot
    class Response
      attr_accessor :topic, :content
      def initialize **params
        params.each{|key, value| send("#{key}=", value)}
      end
    end
  end
end