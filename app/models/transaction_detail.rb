class TransactionDetail < ApplicationRecord
  belongs_to :transactionn,
             class_name: 'Transaction',
             foreign_key: 'transaction_id'

  belongs_to :product
  belongs_to :user
end
