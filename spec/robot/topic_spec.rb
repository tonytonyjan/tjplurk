require 'tjplurk/robot/topic'

describe Tjplurk::Robot::Topic do
  it "loads YAML" do
    topics = Tjplurk::Robot::Topic.load <<-EOS
- name: 早安
  pattern: 早安
  responses:
    - Good morning
    - 早喔
    - 早安啊
- name: 晚安
  pattern: 晚安
  responses:
    - 晚安
    - 有個好夢
    - 偶爾睡一下也不錯啦
EOS
    expect(topics.length) == 2
    topics.each{|topic| expect(topic.responses.length) == 3}
    first = topics.first
    expect(first) == '早安'
    expect(first.responses.first) == 'Good morning'
    expect(first.responses.first.topic) == first
  end
end