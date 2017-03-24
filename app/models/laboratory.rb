class Laboratory < ApplicationRecord
  has_many :products, inverse_of: :laboratory
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, presence: { case_sensitive: false }

  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end
end
