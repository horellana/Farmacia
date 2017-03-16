class TransactionDetail < ApplicationRecord
  belongs_to :transactionn,
             class_name: 'Transaction',
             foreign_key: 'transaction_id'

  belongs_to :product, autosave: true

  def self.build(transactionn, product, quantity)
    td = TransactionDetail.new
    td.product = product
    td.quantity = quantity
    td.unit_price = product.price
    td.net_price = product.net_price
    td.discount = product.discount
    td.devolution = 'no'
    td.transactionn = transactionn
  end
end
