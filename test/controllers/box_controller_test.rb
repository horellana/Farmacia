require 'test_helper'

class BoxControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get box_new_url
    assert_response :success
  end

  test "should get destroy" do
    get box_destroy_url
    assert_response :success
  end

end
