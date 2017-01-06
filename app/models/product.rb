class Product < ApplicationRecord
  belongs_to :provider
  belongs_to :medicinal_ingredient
  belongs_to :dose
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :sale_price, presence: true
  validates :purchase_price, presence: true
  validates :be, presence: true
  validates :isp, presence: true
  validates :discount, presence: true

  validates :category, presence: true
  validates :dose, presence: true
  validates :medicinal_ingredient, presence: true
  validates :provider, presence: true

  default_scope do
    select('*, sale_price - purchase_price as price').order('price desc')
  end

  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

  def price
    sale_price - discount
  end

  def profit
    sale_price - purchase_price - discount
  end
end
