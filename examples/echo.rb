require 'tjplurk'

api = Tjplurk::API.new
api.real_time do |plurk|
  if plurk['type'] == 'new_plurk'
    params = {
      plurk_id: plurk['plurk_id'],
      content: plurk['content_raw'],
      qualifier: ':'
    }
    api.request '/APP/Responses/responseAdd', params
  end
end