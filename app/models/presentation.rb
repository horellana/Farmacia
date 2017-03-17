class Presentation < ApplicationRecord
  # has_many :presentation_details
  # has_many :products, through: :presentation_details

  validates :name, presence: true

  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

end
