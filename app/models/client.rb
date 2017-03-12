class Client < ApplicationRecord
  has_many :transactions

  validates :name, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :lastname, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :rut, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :rut, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  validates :email, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  #validates :gender, presence: true


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
