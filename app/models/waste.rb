class Waste < ApplicationRecord
  belongs_to :product, inverse_of: :wastes
  belongs_to :office, inverse_of: :wastes
  belongs_to :inventory, inverse_of: :wastes

  accepts_nested_attributes_for :product

  validates :amount, presence: true
  validates :amount, numericality: true

  validates :office, presence: true
  validates :inventory, presence: true
  validates :product, presence: true

  before_save :set_date

  scope :match_code, ->(code) do
    joins(:product).where(products: { code: code })
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

  private

  def set_date
    self.date ||= Time.now
  end
end
