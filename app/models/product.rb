class Product < ApplicationRecord
  belongs_to :provider
  belongs_to :medicinal_ingredient
  belongs_to :dose
  belongs_to :category

  has_one :inventory, autosave: true

  validates :name, presence: true
  validates :description, presence: true
  validates :sale_price, presence: true
  validates :sale_price, numericality: { only_integer: true }
  validates :purchase_price, presence: true
  validates :purchase_price, numericality: { only_integer: true }
  #validates :be, presence: true
  validates :isp, presence: true
  validates :discount, presence: true
  validates :discount, numericality: { only_integer: true }

  validates :category, presence: true
  validates :medicinal_ingredient, presence: true
  validates :provider, presence: true

  validates :inventory, presence: true
  validates_associated :inventory

  validates :dose, presence: true
  validates_associated :dose

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

  def stock
    inventory.stock
  end

  def decrease_stock(n=1)
    inventory.decrease_stock(n)
  end

  def increase_stock(n=1)
    inventory.increase_stock(n)
  end

  def identifier
    id.to_s + '_' + name
  end
end
