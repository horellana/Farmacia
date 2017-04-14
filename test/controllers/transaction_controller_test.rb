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
         params: { search_product_field: products(:ibuprofeno).name,
                   product_quantity: 1 },
         xhr: true

    post transactions_path, params: { tipo_pago: PaymentMethod.first.id, monto_pago: 10000 }

    follow_redirect!

    assert_not_equal cart_id, session[:cart_id]
  end

  test 'No se puede crear una transaccion con el carro vacio' do
    sign_in users(:one)
    get new_cart_path

    original_transaction_count = Transaction.count

    post transactions_path

    assert_equal 'El carrito esta vacio!', flash[:alert]
    assert_equal original_transaction_count, Transaction.count
  end
end
