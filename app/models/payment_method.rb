class PaymentMethod < ApplicationRecord
  has_many :payments
  has_many :transactionns,
           class_name: 'Transaction',
           foreign_key: 'transaction_id',
           inverse_of: :payment_method,
           through: :payments
end
