require 'test_helper'

class LowStockControllerTest < ActionDispatch::IntegrationTest
  test "no funciona sin iniciar sesion" do
    get low_stock_index_url
    assert_response :redirect
  end

end
