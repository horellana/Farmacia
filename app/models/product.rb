class Product < ApplicationRecord
  has_many :historic_prices

  has_many :principle_details
  has_many :principles, through: :principle_details, inverse_of: :products
  accepts_nested_attributes_for :principle_details

  belongs_to :presentation
  accepts_nested_attributes_for :presentation

  belongs_to :laboratory, inverse_of: :products
  accepts_nested_attributes_for :laboratory

  belongs_to :provider, inverse_of: :products
  accepts_nested_attributes_for :provider

  belongs_to :category, inverse_of: :products
  accepts_nested_attributes_for :category

  has_one :inventory, autosave: true, dependent: :delete, inverse_of: :product
  accepts_nested_attributes_for :inventory

  validates :code, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  validates :code, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :sale_price, numericality: { only_integer: true }
  validates :name, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :sale_price, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :code, numericality: { only_integer: true }
  validates :purchase_price, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :purchase_price, numericality: { only_integer: true }
  validates :isp, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :discount, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :discount, numericality: { only_integer: true }

  validates :category, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :principles, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :provider, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :laboratory, presence: {case_sensitive: false ,message: "no puede estar vacio"}

  validates :inventory, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates_associated :inventory

  validates :presentation, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates_associated :presentation

  validates_with NameValidator

  default_scope do
    select('*, sale_price - purchase_price as price').order('price desc')
  end

  scope :match_name, ->(name) do
    where('name ilike ?', "%#{name}%")
  end

  scope :low_stock, ->() do
    where(id: Inventory.low_stock)
  end

  def tax
    sale_price * 0.19
  end

  def net_price
    sale_price + (sale_price * 0.19) - discount
  end

  def price
    sale_price
  end

  def profit
    sale_price - purchase_price - discount
  end

  def stock
    inventory.stock
  end

  def minimum_stock
    inventory.minimum_stock
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

  def principles_string
    principles.map(&:name).join('-')
  end

  def self.default_product(product=self.new)
    product.provider ||= Provider.new
    product.category ||= Category.new
    product.laboratory ||= Laboratory.new
    product.presentation ||= Presentation.new
    product.inventory ||= Inventory.new
    return product
  end
end
