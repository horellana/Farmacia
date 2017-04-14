require 'test_helper'

class PrinciplesControllerTest < ActionDispatch::IntegrationTest
  test "no funciona sin iniciar sesion" do
    get principles_path
    assert_response :redirect
  end

  test "Se puede crear un principio activo" do
    sign_in(users(:one))
    original_principle_count = Principle.count
    post principles_path, params: { principle: { name: 'foo' }}

    assert_equal original_principle_count + 1, Principle.count
    assert_equal 'foo', Principle.last.name
  end
end
