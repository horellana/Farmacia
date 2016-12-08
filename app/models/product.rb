class Product < ApplicationRecord
  acts_as_shopping_cart_item_for :shopping_cart

  belongs_to :provider
  belongs_to :medicinal_ingredient
  belongs_to :dose
  belongs_to :category

  def profit
    sale_price - purchase_price - discount
  end
end
