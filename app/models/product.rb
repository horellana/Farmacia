class StockValidator < ActiveModel::Validator
  def validate(record)
    if record.stock and record.stock < 0
      record.errors[:stock] << 'El stock no puede ser menor a 0!'
    end
  end
end

class Product < ApplicationRecord
  belongs_to :provider
  belongs_to :medicinal_ingredient
  belongs_to :dose
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :sale_price, presence: true
  validates :sale_price, numericality: { only_integer: true }
  validates :purchase_price, presence: true
  validates :pruchase_price, numericality: { only_integer: true }
  validates :be, presence: true
  validates :isp, presence: true
  validates :discount, presence: true
  validates :discount, numericality: { only_integer: true }

  validates :stock, presence: true
  validates :stock, numericality: { only_integer: true }

  validates :category, presence: true
  validates :dose, presence: true
  validates :dose, numericality: true
  validates :medicinal_ingredient, presence: true
  validates :provider, presence: true

  validates :minimum_stock, presence: true
  validates :minimum_stock, numericality: { only_integer: true }

  validates_with StockValidator

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

  def decrease_stock(n=1)
    self.stock -= n
    save
  end

  def increase_stock(n=1)
    self.stock += n
    save
  end

  def identifier
    id.to_s + '_' + name
  end
end
