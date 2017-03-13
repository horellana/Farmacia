class MedicinalIngredient < ApplicationRecord

validates :name, presence: {case_sensitive: false ,message: "no puede estar vacio"}

  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

end
