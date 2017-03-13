class Product < ApplicationRecord
  belongs_to :provider, optional: true
  belongs_to :medicinal_ingredient, optional: true
  belongs_to :dose, optional: true
  belongs_to :category, optional: true

  has_one :inventory, autosave: true, dependent: :delete

  validates :name, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  #validates :description, presence: true
  validates :sale_price, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :sale_price, numericality: { only_integer: true }
  validates :purchase_price, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :purchase_price, numericality: { only_integer: true }
  #validates :be, presence: true
  validates :isp, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :discount, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :discount, numericality: { only_integer: true }

  validates :category, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :medicinal_ingredient, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :provider, presence: {case_sensitive: false ,message: "no puede estar vacio"}

  validates :inventory, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates_associated :inventory

  validates :dose, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates_associated :dose

  validates_with NameValidator

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
