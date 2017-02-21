class Client < ApplicationRecord
  has_many :transactions

  validates :name, presence: true
  validates :lastname, presence: true

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
