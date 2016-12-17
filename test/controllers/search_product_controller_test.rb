require 'test_helper'

class SearchProductControllerTest < ActionDispatch::IntegrationTest
  test "deberia mandar al login si falta iniciar sesion" do
    get search_product_index_url
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  test "should get index" do
    get search_product_index_url, params: {search_product_field: 'pa'}, xhr: true
    assert_response :success
  end
end
