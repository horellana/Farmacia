class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not an email") unless
      value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
end

class Client < ApplicationRecord
  has_many :transactions

  validates :name, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :lastname, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :rut, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :rut, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  validates_with RUTValidator
  validates_with NameValidator
  validates :email, presence: true, email: true
  validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  validates :address, presence: {case_sensitive: false ,message: "no puede estar vacio"}
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
