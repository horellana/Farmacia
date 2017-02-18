class Category < ApplicationRecord
  has_many :products, inverse_of: :category
  
  scope :match_description, ->(description) do
    where('description ilike ?', "%#{description}%")
  end
end
