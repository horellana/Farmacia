class Client < ApplicationRecord
  has_many :transactions

  validates :name, presence: { case_sensitive: false }
  validates :lastname, presence: { case_sensitive: false }
  validates :rut, presence: { case_sensitive: false }
  validates :rut, uniqueness: { case_sensitive: false }
  validates :email, presence: true, email: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :address, presence: { case_sensitive: false }

  validates_with RutValidator
  validates_with NameValidator

  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

  def self.from_rut(rut)
    begin
      return Client.find_by! rut: rut
    rescue ActiveRecord::RecordNotFound
      return Client.create rut: rut
    end
  end
end
