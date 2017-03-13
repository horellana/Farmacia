class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not an email") unless
      value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
end


class Provider < ApplicationRecord

  validates :name, presence: true
  validates :rut, presence: true
  validates_with RutValidator
  validates :rut, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  validates :business_name, presence: true
  validates :address, presence: true
  validates :phone_one, numericality: { only_integer: true }
  validates :email, presence: true, email: true
  validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  validates_with NameValidator

  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

end
