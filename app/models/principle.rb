class Principle < ApplicationRecord
  has_many :principle_details
  has_many :products, through: :principle_details

  validates :name, presence: {case_sensitive: false ,message: "no puede estar vacio"}

  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

end
