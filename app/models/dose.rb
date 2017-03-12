class Dose < ApplicationRecord

  validates :kind, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :quantity, presence: {case_sensitive: false ,message: "no puede estar vacio"}

  scope :match_kind, ->(kind) do
    where('kind ilike ?', "%#{kind}%")
  end

end
