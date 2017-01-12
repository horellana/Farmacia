require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test 'Los carros parten vacios' do
    cart = Cart.create

    assert cart.empty?
    assert_equal 0, cart.items.length
  end

  test 'Se pueden agregar productos a un carro' do
    cart = Cart.create

    cart.add(paracetamol)

    assert_equal cart.items.length, 1
    assert_equal paracetamol, cart.items.first.product
    assert_equal 6, paracetamol.stock
    assert_equal 1, cart.items.first.quantity
    assert cart.items.first.persisted?

    cart.add(paracetamol)

    assert_equal cart.items.length, 1
    assert_equal 5, paracetamol.stock
    assert_equal 2, cart.items.first.quantity
    assert_equal 5, cart.items.first.product.stock
    assert cart.items.first.persisted?
  end

  test 'Calcula el precio correctamente' do
    cart = Cart.create
    cart.add products(:paracetamol)
    assert_equal products(:paracetamol).price, cart.total
  end

  test 'Al eliminar un carro de compras, sin realizar una venta, el stock de productos no se corrompe' do
    cart = Cart.create!

    product = products(:paracetamol)

    assert_equal 7, product.stock

    original = product.stock

    cart.add(paracetamol)
    cart.add(paracetamol)
    cart.add(paracetamol)
    cart.add(paracetamol)
    cart.add(paracetamol)

    cart.drop

    assert_equal original, paracetamol.stock
  end

  test 'No se pueden agregar productos al carro si el stock es cero' do
    product = products(:paracetamol)
    product.inventory.stock = 0
    product.save!

    cart = Cart.create
    cart.add(product)

    assert_equal 0, product.stock
    assert_equal 0, cart.items.first.quantity
  end
end
