require 'test_helper'

class SearchProductControllerTest < ActionDispatch::IntegrationTest
  test "no funciona sin iniciar sesion" do
    get search_product_index_url, xhr: true
    assert_response :unauthorized
  end

  test "encuentra al producto correcto" do
    user = users :one

    sign_in user

    get search_product_index_url,
        params: {search_product_field: 'pa'},
        xhr: true

    assert_response :success

    assert_match /Paracetamol/, @response.body,
                 'encuentra productos sin tener el nombre completo'

    get search_product_index_url,
        params: {search_product_field: 'ibuprofeno'},
        xhr: true

    assert_match /Ibuprofeno/, @response.body,
                 'encuenta productos segun nombre'

    sign_out(user)
  end
end
