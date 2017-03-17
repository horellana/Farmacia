class Product < ApplicationRecord
  has_many :principle_details
  has_many :principles, through: :principle_details

  belongs_to :provider, optional: true
  has_one :presentation, required: true
  belongs_to :category, optional: true

  has_one :inventory, autosave: true, dependent: :delete

  validates :name, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :sale_price, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :sale_price, numericality: { only_integer: true }
  validates :purchase_price, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :purchase_price, numericality: { only_integer: true }
  validates :isp, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :discount, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :discount, numericality: { only_integer: true }

  validates :category, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :principles, presence: {case_sensitive: false ,message: "no puede estar vacio"}
  validates :provider, presence: {case_sensitive: false ,message: "no puede estar vacio"}

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

  def self.match_principle(mi)
    joins(:principle)
      .where('principle.name ilike ?', "%#{mi}%")
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
