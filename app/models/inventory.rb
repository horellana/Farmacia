class StockValidator < ActiveModel::Validator
  def validate(record)
    if record.stock <= 0
      record.errors[:stock] << 'El stock no puede ser menor a 0!'
    end
  end
end


class Inventory < ApplicationRecord
  belongs_to :product
  validates_with StockValidator
end
