class BoxMovement < ApplicationRecord
  belongs_to :box
  belongs_to :user

  has_many :transactions

  def gains
    transactions.map(&:total).inject(0, :+)
  end

  def final_amount
    gains + start_amount
  end
end
