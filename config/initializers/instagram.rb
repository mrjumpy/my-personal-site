

require "instagram"

#enable :sessions

CALLBACK_URL = "https://instanoad-mrjumpy.c9.io"
Instagram.configure do |config|
  config.client_id = "369c6cd0f2254df6acfaf3045ddf78b5"
  config.client_secret = "0e199dc46b9248b28dd387056e72d377"
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end
