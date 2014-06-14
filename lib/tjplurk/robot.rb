module Tjplurk
  class Robot
    def initialize topics
      @topics = topics
    end

    def respond s
      if matched = @topics.select{|category| Regexp.new(category.pattern).match(s) }.sample
        matched.responses.sample.content
      end
    end
  end
end