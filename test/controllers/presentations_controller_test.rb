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

  test "Se puede editar un laboratorio" do
    sign_in(users(:one))

    presentation = Presentation.first
    original_name = presentation.name

    put presentation_path(presentation), params: { presentation: { name: original_name + 'foo' }}

    assert_response :redirect
    assert_not_equal original_name, Presentation.first.name
  end
end
