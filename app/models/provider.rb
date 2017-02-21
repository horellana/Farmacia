class Provider < ApplicationRecord

  validates :name, presence: true
  validates :rut, presence: true
  validates :business_name, presence: true
  validates :address, presence: true
  
  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

end
