class Inventory < ApplicationRecord
  belongs_to :office
  belongs_to :product, inverse_of: :inventory
  has_many :wastes


  validates :stock, presence: true
  validates :stock, numericality: { only_integer: true }

  validates :minimum_stock, presence: true
  validates :minimum_stock, numericality: { only_integer: true }

  validates :product, presence: true
  validates :office, presence: true

  scope :low_stock, ->() do
    select('product_id').where('stock <= minimum_stock')
  end

  def total
    stock * product.sale_price
  end

  def increase_stock(n=1)
    self.stock += n
    save
  end

  def decrease_stock(n=1)
    self.stock -= n
    save
  end
end
