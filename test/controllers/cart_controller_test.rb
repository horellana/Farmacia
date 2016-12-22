require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  test "Manda al login si falta iniciar sesion" do
    get new_cart_path
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
end
