require 'tjplurk'
require 'yaml'

class Robot
  def initialize yaml_data
    @data = YAML.load(yaml_data)
  end

  def respond s
    if match = @data.select{|i| s[i['pattern']]}.sample
      match['responses'].sample
    end
  end
end

robot = Robot.new DATA.read
api = Tjplurk::API.new

api.real_time do |plurk|
  jj plurk
  content = plurk['type'] == 'new_plurk' ? plurk['content'] : plurk['response']['content']
  content.gsub!(/<[^>]*>/, '')
  response = robot.respond(content)
  response_params = {
    plurk_id: plurk['plurk_id'],
    content: response,
    qualifier: ':'
  }
  api.request '/APP/Responses/responseAdd', response_params if plurk['type'] == 'new_plurk'
end

__END__
- pattern: 早安
  responses:
    - Good morning
    - 早喔
    - 早安啊
- pattern: 晚安
  responses:
    - 晚安
    - 有個好夢
    - 偶爾睡一下也不錯啦