class Transaction < ApplicationRecord
  belongs_to :client
  has_many :details, class_name: 'TransactionDetail'

  def total
    details.map { |d| d.net_price * d.quantity }.inject(0, :+)
  end
end
