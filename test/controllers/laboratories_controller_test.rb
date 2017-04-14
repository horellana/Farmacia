require 'test_helper'

class LaboratoriesControllerTest < ActionDispatch::IntegrationTest
  test "no funciona sin iniciar sesion" do
    get laboratories_path
    assert_response :redirect
  end

  test "Se puede crear un laboratorio" do
    sign_in(users(:one))
    original_laboratory_count = Laboratory.count
    post laboratories_path, params: { laboratory: { name: 'foo' }}

    assert_equal original_laboratory_count + 1, Laboratory.count
    assert_equal 'foo', Laboratory.last.name
  end
end
