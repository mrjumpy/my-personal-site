require "uri"
require "net/http"


class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  
 
  def index
    if !params[:code].nil?
       
        response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
        session[:access_token] = response.access_token
       
     
    end
    
     
    
  
    
  end
  
  def getPics
    client = Instagram.client(:access_token => session[:access_token])
    #client.user_recent_media
    render :json => client.user_recent_media
  end
  
  def getComments
    client = Instagram.client(:access_token => session[:access_token])
    puts params[:id]
    render :json => client.media_comments(params[:id]);
  end
  
  def temp
    puts 'temp testing subscribe'
  end
  
  def registerSubscription
    #logger.info request.headers
    puts "registerSubscription\n" 
    client = Instagram.client(:access_token => session[:access_token])
    client.create_subscription("user", "https://instanoad-mrjumpy.c9.io/url")
    
     
    #pData = {'client_id' => '369c6cd0f2254df6acfaf3045ddf78b5', 'client_secret' => "0e199dc46b9248b28dd387056e72d377", 'object' => 'user', 'callback_url' => URI.parse('https://instanoad-mrjumpy.c9.io/url'), 'aspect' => 'media'}
    #x = Net::HTTP.post_form(URI.parse('https://api.instagram.com/v1/subscriptions/'), pData)
     #aa = URI.parse('https://instanoad-mrjumpy.c9.io/url')
   # response = HTTParty.post('https://api.instagram.com/v1/subscriptions/?client_id=369c6cd0f2254df6acfaf3045ddf78b5&client_secret=0e199dc46b9248b28dd387056e72d377&object=user&aspect=media&callback_url="https://instanoad-mrjumpy.c9.io"')
    
#puts response.body
    
    #render :json => "GG"
  end
   
  
  def loginInstagram
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end
  
  def loginToInstagram
    client_id = '369c6cd0f2254df6acfaf3045ddf78b5'
    client_secret = '0e199dc46b9248b28dd387056e72d377'
    grant_type =  'authorization_code'
    redirect_uri = 'https://instanoad-mrjumpy.c9.io'
    code = params[:data][:code]
    
    pData = {'client_id' => client_id, 'client_secret' => client_secret, 'grant_type' => grant_type, 'redirect_uri' => redirect_uri, 'code' => code}
    x = Net::HTTP.post_form(URI.parse('https://api.instagram.com/oauth/access_token'), pData)

    
    render :json => x.body
    
  end
  
   
end
