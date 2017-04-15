# coding: utf-8
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

  test "Se puede editar una categoria" do
    sign_in(users(:one))

    category = Category.first
    original_description = category.description

    put category_path(category), params: { category: { description: original_description + 'foo' }}

    assert_response :redirect
    assert_not_equal original_description, Category.first.description
  end
end
