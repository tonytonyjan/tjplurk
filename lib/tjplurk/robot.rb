module Tjplurk
  class Robot
    def initialize topics
      @topics = topics
    end

    def respond input
      if matched = @topics.each{|topic| topic.pattern = Regexp.new(topic.pattern) if topic.pattern.is_a? String}.select{|topic| topic.pattern.match(input) }.sample
        response = matched.responses.sample.content
        match_data = matched.pattern.match(input)
        response.gsub(/\\(\d+)/){|s| match_data[$1.to_i]}
      end
    end
  end
end