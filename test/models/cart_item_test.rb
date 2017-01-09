require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
  test 'Se puede incrementar la cantidad de productos a vender' do
    item = cart_items(:one)
    item.cart = Cart.create

    product = products(:paracetamol)

    item.product = product

    item.increase_quantity

    assert_equal 3, item.quantity,
                 'Se aumenta la cantidad de productos a vender'

    assert_equal 6, product.stock,
                 'El stock del producto disminuye'
  end

  test 'Se puede disminuir la cantidad de productos a vender' do
    item = cart_items(:one)
    item.cart = Cart.create

    product = products(:paracetamol)
    item.product = product

    item.decrease_quantity

    assert_equal 1, item.quantity
    assert_equal 8, product.stock
  end

  test 'El item se elimina si su cantidad es cero' do
    cart = Cart.create

    item = CartItem.create
    item.cart = cart
    item.product = products(:ibuprofeno)

    item.decrease_quantity

    assert_not item.persisted?
  end

  test 'Al eliminar un item se reestablece el stock del producto' do
    cart = Cart.create

    item = CartItem.create
    item.cart = cart
    product = products(:paracetamol)
    item.product = product

    item.drop

    assert_equal 7, product.stock
  end
end
