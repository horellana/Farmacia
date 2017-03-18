class Principle < ApplicationRecord
  has_many :principle_details
  has_many :products, through: :principle_details, inverse_of: :principles

  validates :name, presence: { case_sensitive: false }

  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

  def self.from_string(string)
    names = string.split('-')
    return where(name: names)
  end
end
