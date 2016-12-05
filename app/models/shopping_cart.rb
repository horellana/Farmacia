class ShoppingCart < ApplicationRecord
  acts_as_shopping_cart_using :product

  def tax_pct
    0
  end
end
