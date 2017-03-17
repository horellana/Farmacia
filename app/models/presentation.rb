class Presentation < ApplicationRecord
  # has_many :presentation_details
  # has_many :products, through: :presentation_details

  has_many :products

  validates :name, presence: true

  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

end
