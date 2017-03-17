class Presentation < ApplicationRecord
  belongs_to :products, required: false

  validates :name, presence: true

  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

end
