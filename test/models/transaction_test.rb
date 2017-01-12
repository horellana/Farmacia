require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "Por defecto una transaccion no tiene detalles" do
    user = users :one
    transaction = Transaction.create user: user
    assert_equal transaction.details.length, 0
  end

  test "Se pueden agregar productos a una transaccion" do
    t = Transaction.new user: users(:one), cart: carts(:one)
    t.add_product products(:ibuprofeno), 1

    assert_equal 1, t.details.length
  end

  test 'No se puede guardar una transaccion sin asignarle un carro de compras' do
    user = users :one
    t = Transaction.new user: user
    t.add_product products(:ibuprofeno), 1

    assert_not t.valid?
  end

  test 'No se pueden realizar transacciones sin productos' do
    t = Transaction.new user: users(:one), cart: carts(:one)

    assert_not t.valid?
  end
end
