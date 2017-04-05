class Waste < ApplicationRecord

  belongs_to :product, inverse_of: :wastes
  belongs_to :office, inverse_of: :wastes
  belongs_to :inventory, inverse_of: :wastes

  accepts_nested_attributes_for :product


  def stock
    inventory.stock
  end

  def decrease_stock(n=1)
    inventory.decrease_stock(n)
  end

  def increase_stock(n=1)
    inventory.increase_stock(n)
  end
end
