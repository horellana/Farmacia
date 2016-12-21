require 'test_helper'

class RutControllerTest < ActionDispatch::IntegrationTest
  test "no funciona sin iniciar sesion" do
    put set_rut_path, params: { data: '11111111-1' }, xhr: true
    assert_response :unauthorized
  end

  test "el rut se guarda en la sesion" do
    sign_in users(:one)
    put set_rut_path, params: { data: '11111111-1' }, xhr: true
    assert_equal session[:client_rut], '11111111-1'
    sign_out users(:one)
  end
end
