require 'test_helper'

class RutControllerTest < ActionDispatch::IntegrationTest
  test "no funciona sin iniciar sesion" do
    put set_rut_path, params: { data: '11111111-1' }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
end
