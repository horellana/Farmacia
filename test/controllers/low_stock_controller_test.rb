require 'test_helper'

class LowStockControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get low_stock_index_url
    assert_response :success
  end

end
