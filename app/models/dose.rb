class Dose < ApplicationRecord
     
     
     
  scope :match_kind, ->(kind) do
    where('kind ilike ?', "%#{kind}%")
  end
     
end
