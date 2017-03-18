class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :client, required: false
  belongs_to :box_movement
  belongs_to :payment_method, inverse_of: :transactionns

  has_many :details, class_name: 'TransactionDetail', autosave: true
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
    td = TransactionDetail.build(self, product, quantity)
    self.details << td
  end

  def change
    (total - payed_amount).abs
  end

  private

  def default_values
    self.iva ||= 0.19
  end
end
