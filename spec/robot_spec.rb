require 'tjplurk/robot'
require 'tjplurk/robot/topic'

describe Tjplurk::Robot do
  it 'works' do
    topics = Tjplurk::Robot::Topic.load <<-EOS
- name: 早安
  pattern: 早安
  responses:
    - Good morning
    - 早喔
    - 早安啊
- name: 晚安
  pattern: 晚安\s+！
  responses:
    - 晚安
    - 有個好夢
    - 偶爾睡一下也不錯啦
EOS
    robot = Tjplurk::Robot.new topics
    expect(topics[0].responses.map(&:content)).to include(robot.respond('早安'))
    expect(topics[1].responses.map(&:content)).to include(robot.respond('晚安！'))
  end
end