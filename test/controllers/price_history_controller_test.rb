require 'test_helper'

class PriceHistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get price_history_index_url
    assert_response :success
  end

end
