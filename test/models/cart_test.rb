require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "Los carros parten vacios" do
    cart = Cart.new

    assert cart.empty?
    assert_equal 0, cart.items.length
  end

  test "Se pueden agregar productos aun carro" do
    cart = Cart.new
    cart.add(products :paracetamol)

    assert_not cart.empty?
    assert_equal 1, cart.items.length
    assert_equal products(:paracetamol), cart.items[0].product
    assert_equal 1, cart.items[0].quantity

    cart.add(products :paracetamol)

    assert_not cart.empty?
    assert_equal 1, cart.items.length
    assert_equal products(:paracetamol), cart.items[0].product
    assert_equal 2, cart.items[0].quantity
  end

  test "Se pueden quitar productos del carro" do
    cart = Cart.new
    cart.add(products :paracetamol)
    cart.remove(products :paracetamol)

    assert cart.empty?
  end

  test "Calcula el precio correctamente" do
    cart = Cart.new
    cart.add(products :paracetamol)
    assert_equal (products :paracetamol).price, cart.total
  end
end
