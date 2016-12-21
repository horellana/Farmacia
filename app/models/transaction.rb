class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :client, required: false
  has_many :details, class_name: 'TransactionDetail'

  before_save :default_values

  def total
    details.map { |d| d.net_price * d.quantity }.inject(0, :+)
  end

  def date
    created_at.to_s(:long)
  end

  def add_product(product, quantity)
    td = TransactionDetail.new
    td.product = product
    td.quantity = quantity
    td.unit_price = product.price
    td.net_price = product.price - (product.price * 0.19)
    td.discount = product.discount
    td.devolution = 'no'
    self.details << td
  end

  private

  def default_values
    iva ||= 0.19
  end
end
