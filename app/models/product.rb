class Product < ApplicationRecord
  belongs_to :provider
  belongs_to :medicinal_ingredient
  belongs_to :dose
  belongs_to :category

  def self.order_by_profit
    select('*, sale_price - purchase_price as price')
      .order('price desc')
  end

  def price
    sale_price - discount
  end

  def profit
    sale_price - purchase_price - discount
  end
end
