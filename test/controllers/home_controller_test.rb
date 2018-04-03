require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get choose_user" do
    get home_choose_user_url
    assert_response :success
  end

end
