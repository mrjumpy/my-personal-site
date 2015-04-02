module ApplicationHelper
    def username
        client = Instagram.client(:access_token => session[:access_token])
        username = "Hello," + client.user.username
        username
    end
    
    def limitsRemain
        client = Instagram.client(:access_token => session[:access_token])
        #html = "<h1/>View API Rate Limit and calls remaining</h1>"
        response = client.utils_raw_response
        "剩餘使用量" + response.headers[:x_ratelimit_remaining]
    end
    
    def createComments
       
    end
    
    def filterBy(str)
        puts str
    end
end
