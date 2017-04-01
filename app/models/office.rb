class Office < ApplicationRecord
  has_many :users
  has_many :wastes
  has_many :products, inverse_of: :category
  
  has_one :inventory, autosave: true, dependent: :delete, inverse_of: :product
  accepts_nested_attributes_for :inventory

  validates :address, presence: { case_sensitive: false }
  validates :sii_code, presence: { case_sensitive: false }
  validates :phone, presence: { case_sensitive: false }
  validates :hour_in, presence: { case_sensitive: false }
  validates :hour_out, presence: { case_sensitive: false }

  scope :match_address, ->(address) do
    where('address ilike ?', "%#{address}%")
  end

end
