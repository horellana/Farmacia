require 'test_helper'

class NameControllerTest < ActionDispatch::IntegrationTest
  test "no funciona sin iniciar sesion" do
    put set_name_path, params: { data: '11111111-1' }, xhr: true
    assert_response :unauthorized
  end

  test "el name se guarda en la sesion" do
    sign_in users(:one)
    put set_name_path, params: { data: '11111111-1' }, xhr: true
    assert_equal session[:client_name], '11111111-1'
    sign_out users(:one)
  end
end
