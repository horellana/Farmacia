require 'test_helper'

class SalesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_sale_path
    assert_response :success
  end

  test "should get create" do
    post sales_path
    assert_response :success
  end

end
