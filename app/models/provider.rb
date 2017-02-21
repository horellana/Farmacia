class Provider < ApplicationRecord

  validates :name, presence: true

  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

end
