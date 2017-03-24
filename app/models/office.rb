class Office < ApplicationRecord
  has_many :users
  has_many :products, inverse_of: :category

  validates :address, presence: { case_sensitive: false }
  validates :sii_code, presence: { case_sensitive: false }
  validates :phone, presence: { case_sensitive: false }
  validates :hour_in, presence: { case_sensitive: false }
  validates :hour_out, presence: { case_sensitive: false }

  scope :match_address, ->(address) do
    where('address ilike ?', "%#{address}%")
  end

end
