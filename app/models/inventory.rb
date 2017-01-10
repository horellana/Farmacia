class StockValidator < ActiveModel::Validator
  def validate(record)
    if record.stock and record.stock < 0
      record.errors[:stock] << 'El stock no puede ser menor a 0!'
    end
  end
end

class Inventory < ApplicationRecord
  belongs_to :office
  belongs_to :product

  validates :stock, presence: true
  validates :minimum_stock, presence: true

  validates_with StockValidator

  def increase_stock(n=1)
    self.stock += n
    save
  end

  def decrease_stock(n=1)
    self.stock -= n
    save
  end
end
