require 'tjplurk/api'
require 'json'

describe Tjplurk::API do
  it 'can find ~/.tjplurk' do
    expect(File).to exist(File.join(ENV['HOME'], '.tjplurk'))
  end

  it 'works' do
    expect {
      api = Tjplurk::API.new
      api.request('/APP/Users/me')  
    }.not_to raise_error
  end
end