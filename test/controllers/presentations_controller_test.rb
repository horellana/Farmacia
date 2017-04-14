require 'test_helper'

class PresentationsControllerTest < ActionDispatch::IntegrationTest
  test "no funciona sin iniciar sesion" do
    get presentations_path
    assert_response :redirect
  end

  test "Se puede crear una presentacion" do
    sign_in(users(:one))
    original_presentation_count = Presentation.count
    post presentations_path, params: { presentation: { name: 'foo' }}

    assert_equal original_presentation_count + 1, Presentation.count
    assert_equal 'foo', Presentation.last.name
  end
end
