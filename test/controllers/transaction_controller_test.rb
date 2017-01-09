require 'test_helper'

class TransactionControllerTest < ActionDispatch::IntegrationTest
  test 'No funciona sin iniciar sesion' do
    post transactions_path
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test 'Al crear una transaccion se limpia el carro de compras' do
    sign_in users(:one)
    get new_cart_path

    cart_id = session[:cart_id]

    post cart_cart_item_index_path(cart_id),
         params: { search_product_field: products(:ibuprofeno).name },
         xhr: true

    post transactions_path

    follow_redirect!

    assert_not_equal cart_id, session[:cart_id]
  end
end
