class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :office

  validates :rut,  uniqueness: true
  validates :office, presence: true
  validates_with RUTValidator

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def admin?
    admin
  end
end
