class Dose < ApplicationRecord

  validates :kind, presence: true
  validates :quantity, presence: true

  scope :match_kind, ->(kind) do
    where('kind ilike ?', "%#{kind}%")
  end

end
