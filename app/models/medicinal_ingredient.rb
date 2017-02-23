class MedicinalIngredient < ApplicationRecord
     
  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end
     
end
