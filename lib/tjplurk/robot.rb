module Tjplurk
  class Robot
    def initialize topics
      @topics = topics
    end

    def respond input
      if matched = @topics.select{|topic| topic.pattern.match(input) }.sample
        response = matched.responses.sample.content
        input.gsub!(matched.pattern, response)
      end
    end
  end
end