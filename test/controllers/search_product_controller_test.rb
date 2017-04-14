require 'test_helper'

class SearchProductControllerTest < ActionDispatch::IntegrationTest
  test "no funciona sin iniciar sesion" do
    get search_products_path, xhr: true
    assert_response :unauthorized
  end

  test "encuentra al producto correcto" do
    user = users :one

    sign_in user

    get search_products_path,
        params: {product_name: 'Ibuprofeno'},
        xhr: true

    assert_match /Ibuprofeno/, @response.body,
                 'encuenta productos segun nombre'

    sign_out(user)
  end
end
