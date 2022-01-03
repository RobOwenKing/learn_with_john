require 'test_helper'

class PractisedsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get practiseds_create_url
    assert_response :success
  end

  test "should get destroy" do
    get practiseds_destroy_url
    assert_response :success
  end

end
