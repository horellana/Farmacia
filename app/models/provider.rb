class RUTValidator < ActiveModel::Validator
  require 'rut_chileno'
  def validate(record)
    unless RUT::validar(record.rut)
      record.errors[:rut] << I18n.t(:invalid_rut)
    end
  end
end

class Provider < ApplicationRecord

  validates :name, presence: true
  validates :rut, presence: true
  validates_with RUTValidator
  validates :business_name, presence: true
  validates :address, presence: true
  validates :phone_one, numericality: { only_integer: true }
  validates :email, presence: true


  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

end
