class RealtimeController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def url
    puts "meet_challenge"
    
    if params['hub.challenge'].nil?
      gg = "AAA"
    end
     
     
    render :json => gg
   
  end
  
  def newPostPhoto
    puts "newPostPhoto"
    conn = Faraday.new(:url => 'https://api.instagram.com/') do |c|
  c.use Faraday::Request::UrlEncoded  # encode request params as "www-form-urlencoded"
  c.use Faraday::Response::Logger     # log request & response to STDOUT
  c.use Faraday::Adapter::NetHttp     # perform requests with Net::HTTP
end
    
      
 
gg = conn.post '/v1/subscriptions/', {'client_id' => '369c6cd0f2254df6acfaf3045ddf78b5', 'client_secret' => "0e199dc46b9248b28dd387056e72d377", 'object' => 'user', 'callback_url' => 'https://instanoad-mrjumpy.c9.io/url', 'aspect' => 'media'}
     
   puts gg
    render :json => gg
   
  end
end
