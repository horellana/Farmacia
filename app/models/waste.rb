class Waste < ApplicationRecord
     
  belongs_to :product, inverse_of: :wastes
  accepts_nested_attributes_for :product
  
  


end