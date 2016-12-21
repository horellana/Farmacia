require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
  test "Se puede incrementar la cantidad de productos a vender" do
    item = cart_items(:one)
    item.product = products(:paracetamol)

    item.increase_quantity
    assert_equal 3, item.quantity
  end

  test "Se puede disminuir la cantidad de productos a vender" do
    item = cart_items(:one)
    product = products(:paracetamol)
    item.product = product

    item.decrease_quantity
    assert_equal 1, item.quantity
  end

  test "El item se elimina si su cantidad es cero" do
    item = cart_items(:two)
    item.product = products(:ibuprofeno)

    item.decrease_quantity

    assert_not item.persisted?
  end
end
