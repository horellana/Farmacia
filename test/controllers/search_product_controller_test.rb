require 'test_helper'

class SearchProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_product_index_url
    assert_response :success
  end

end
