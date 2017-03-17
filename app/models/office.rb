class Office < ApplicationRecord
  has_many :users
  has_many :products, inverse_of: :category

  validates :address, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :sii_code, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :phone, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :hour_in, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :hour_out, presence: {case_sensitive: false ,message: "no puede estar vacio"}


  scope :match_address, ->(address) do
    where('address ilike ?', "%#{address}%")
  end

end
