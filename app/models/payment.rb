class Payment < ApplicationRecord
  belongs_to :payment_method
  belongs_to :transactionn,
             class_name: 'Transaction',
             foreign_key: 'transaction_id'

  before_save :default_values

  def default_values
    self.amount ||= 0
  end
end
