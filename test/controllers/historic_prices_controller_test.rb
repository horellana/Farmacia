require 'test_helper'

class HistoricPricesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get historic_prices_index_url
    assert_response :success
  end

end
