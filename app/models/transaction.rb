class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :client, required: false
  has_many :details, class_name: 'TransactionDetail'

  def total
    details.map { |d| d.net_price * d.quantity }.inject(0, :+)
  end

  def add_product(product, quantity)
    td = TransactionDetail.new
    td.product = product
    td.quantity = quantity
    td.unit_price = product.price
    td.net_price = product.price - (product.price * 0.19)
    td.discount = product.discount
    td.devolution = 'no'
    td.transactionn = self
    td.save!
  end
end
