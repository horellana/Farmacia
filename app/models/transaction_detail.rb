class TransactionDetail < ApplicationRecord
  # Rails define un metodo llamado 'transaction'
  belongs_to :transactionn
  belongs_to :product
end
