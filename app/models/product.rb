class Product < ApplicationRecord
  acts_as_shopping_cart_item_for :shopping_cart

  belongs_to :provider
  belongs_to :medicinal_ingredient
  belongs_to :dose
  belongs_to :category
end
