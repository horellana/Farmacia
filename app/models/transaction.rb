class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :client, required: false
  belongs_to :box_movement

  has_many :details, class_name: 'TransactionDetail'
  has_one :cart

  validates_with TransactionValidator

  before_save :default_values

  def total
    details.map { |d| d.net_price * d.quantity }.inject(0, :+)
  end

  def date
    "#{created_at.day}/#{created_at.month}/#{created_at.year}"
  end

  def add_product(product, quantity)
    td = TransactionDetail.new
    td.product = product
    td.quantity = quantity
    td.unit_price = product.price
    td.net_price = product.price - (product.price * 0.19)
    td.discount = product.discount
    td.devolution = 'no'

    details << td
  end

  private

  def default_values
    self.iva ||= 0.19
  end
end
