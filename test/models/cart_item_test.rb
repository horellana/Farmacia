require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
  test 'Se puede incrementar la cantidad de productos a vender' do
    item = cart_items(:one)
    item.cart = Cart.create

    product = products(:paracetamol)

    original_stock = product.stock

    item.product = product
    item.increase_quantity

    assert_equal 3, item.quantity,
                 'Se aumenta la cantidad de productos a vender'

    assert_equal original_stock - 1, product.stock,
                 'El stock del producto disminuye'
  end

  test 'Se puede disminuir la cantidad de productos a vender' do
    item = cart_items(:one)
    item.cart = Cart.create

    product = products(:paracetamol)
    item.product = product

    original_stock = product.stock

    item.decrease_quantity

    assert_equal 1, item.quantity
    assert_equal original_stock + 1, product.stock
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
    item = CartItem.create
    item.cart = Cart.create
    item.product = products(:paracetamol)

    original_stock = item.product.stock

    item.drop

    assert_equal original_stock, products(:paracetamol).stock
  end
end
