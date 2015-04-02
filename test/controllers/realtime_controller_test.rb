require 'test_helper'

class RealtimeControllerTest < ActionController::TestCase
  test "should get url" do
    get :url
    assert_response :success
  end

end
