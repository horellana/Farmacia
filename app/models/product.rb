class Product < ApplicationRecord
  belongs_to :provider
  belongs_to :medicinal_ingredient
  belongs_to :dose
  belongs_to :category

  def profit
    sale_price - purchase_price - discount
  end
end
