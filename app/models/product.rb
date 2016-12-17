class Product < ApplicationRecord
  belongs_to :provider
  belongs_to :medicinal_ingredient
  belongs_to :dose
  belongs_to :category

  scope :ordered_by_profit, -> {
    select('*, sale_price - purchase_price as price').order('price desc')
  }

  def price
    sale_price - discount
  end

  def profit
    sale_price - purchase_price - discount
  end
end
