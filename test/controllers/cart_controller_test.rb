require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  test 'Manda al login si falta iniciar sesion' do
    get new_cart_path
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test 'No permite ingresar a la ventana de ventas si es que no hay una caja abierta' do
    user = users(:one)
    sign_in(user)

    get new_cart_path
    assert_response :redirect
    follow_redirect!

    assert_match(/Falta abrir la caja/, @response.body)
  end

  test 'Al ingresar a la vista de ventas se crea un carro de compras' do
    user = users(:one)
    sign_in(user)

    get new_cart_path
    assert_response :redirect
    assert session[:cart_id]
  end

  test 'Se puede eliminar el carro de compras' do
    user = users(:one)
    sign_in user
    get new_cart_path

    original = session[:cart_id]

    cart = Cart.find session[:cart_id]
    cart.add(paracetamol, 1)
    cart.add(paracetamol, 1)

    delete cart_path(cart)

    assert_not_equal original, session[:cart_id]
  end


  test 'Al limpiar el carro se reestablece el stock de los productos' do
    user = users(:one)
    sign_in user

    get new_cart_path

    original = paracetamol.stock

    cart = Cart.find session[:cart_id]
    cart.add(paracetamol, 1)
    cart.add(paracetamol, 1)

    delete cart_path(cart)

    assert_equal original, paracetamol.stock
  end
end
