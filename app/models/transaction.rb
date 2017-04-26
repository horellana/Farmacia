class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :client, required: false
  belongs_to :box_movement

  has_many :details, class_name: 'TransactionDetail', autosave: true
  has_one :cart

  has_many :payments

  after_initialize :default_values
  before_save :set_payed_amount

  validates_with TransactionValidator

  def total
    details.map { |d| d.net_price * d.quantity }.inject(0, :+)
  end

  def calc_payed
    payments.map(&:amount).inject(0, :+)
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
    self.payed_amount ||= 0
  end

  def set_payed_amount
    self.payed_amount = self.calc_payed
  end
end
