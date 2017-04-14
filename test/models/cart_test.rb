require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test 'Los carros parten vacios' do
    cart = Cart.create

    assert cart.empty?
    assert_equal 0, cart.items.length
  end

  test 'Se pueden agregar productos a un carro' do
    cart = Cart.create

    original_stock = paracetamol.stock
    cart.add(paracetamol, 1)

    assert_equal cart.items.length, 1
    assert_equal paracetamol, cart.items.first.product
    assert_equal original_stock - 1, paracetamol.stock
    assert_equal 1, cart.items.first.quantity
    assert cart.items.first.persisted?

    cart.add(paracetamol, 1)

    assert_equal cart.items.length, 1
    assert_equal original_stock - 2, paracetamol.stock
    assert_equal 2, cart.items.first.quantity
    assert_equal original_stock - 2, cart.items.first.product.stock
    assert cart.items.first.persisted?
  end

  test 'Calcula el precio correctamente' do
    cart = Cart.create
    cart.add(products(:paracetamol), 1)
    assert_equal products(:paracetamol).net_price, cart.total
  end

  test 'Al eliminar un carro de compras, sin realizar una venta, el stock de productos no se corrompe' do
    cart = Cart.create!

    original_stock = products(:paracetamol).stock

    product = products(:paracetamol)

    cart.add(paracetamol, 1)
    cart.add(paracetamol, 1)
    cart.add(paracetamol, 1)
    cart.add(paracetamol, 1)
    cart.add(paracetamol, 1)

    cart.drop

    assert_equal original_stock, paracetamol.stock
  end
end
