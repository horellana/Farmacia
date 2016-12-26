require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "Por defecto una transaccion no tiene detalles" do
    user = users :one
    transaction = Transaction.create user: user
    assert_equal transaction.details.length, 0
  end

  test "Se pueden agregar productos a una transaccion" do
    user = users :one
    t = Transaction.create user: user
    t.add_product products(:ibuprofeno), 1

    assert_equal 1, t.details.length
  end
end
