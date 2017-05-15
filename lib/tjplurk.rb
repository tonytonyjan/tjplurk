require 'tjplurk/api'
module Tjplurk
  OAUTH_OPTIONS = {
    site:               'https://www.plurk.com',
    request_token_path: '/OAuth/request_token',
    access_token_path:  '/OAuth/access_token',
    authorize_path:     '/OAuth/authorize'
  }
end