class Provider < ApplicationRecord
  has_many :products, inverse_of: :product

  validates :name, presence: true
  validates :rut, presence: true
  validates :rut, uniqueness: { case_sensitive: false }
  validates :business_name, presence: true
  validates :address, presence: true
  validates :phone_one, numericality: { only_integer: true }
  validates :email, presence: true, email: true
  validates :email, uniqueness: { case_sensitive: false }

  validates_with RutValidator
  validates_with NameValidator

  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

end
