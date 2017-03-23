class Waste < ApplicationRecord
     
  belongs_to :product, inverse_of: :wastes
  accepts_nested_attributes_for :product
  
  
  def stock
    inventory.stock
  end

  def merma
    stock - amount
  end

end