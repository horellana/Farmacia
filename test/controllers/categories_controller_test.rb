require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "no funciona sin iniciar sesion" do
    get categories_path
    assert_response :redirect
  end

  test "Se puede crear una categoria" do
    sign_in(users(:one))
    original_category_count = Category.count
    post categories_path, params: { category: { description: 'foo' }}

    assert_equal original_category_count + 1, Category.count
    assert_equal 'foo', Category.last.description
  end
end
