require 'test_helper'

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  test "no funciona sin iniciar sesion" do
    get inventories_index_url
    assert_response :redirect
  end

end
