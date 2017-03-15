class Inventory < ApplicationRecord
  belongs_to :office
  belongs_to :product

  validates :stock, presence: true
  validates :stock, numericality: { only_integer: true }

  validates :minimum_stock, presence: true
  validates :minimum_stock, numericality: { only_integer: true }

  def increase_stock(n=1)
    self.stock += n
    save
  end

  def decrease_stock(n=1)
    self.stock -= n
    save
  end
end
