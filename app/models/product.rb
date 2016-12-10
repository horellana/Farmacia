class Product < ApplicationRecord
  belongs_to :provider
  belongs_to :medicinal_ingredient
  belongs_to :dose
  belongs_to :category

  def self.order_by_profit
    select('*, sale_price - purchase_price as price')
      .order('price desc')
  end
  
#def init
 #     self.number  ||= 0.0           #will set the default value only if it's nil
 #     self.address ||= build_address #let's you set a default association
#end

  def price
    sale_price - discount
  end

  def profit
    sale_price - purchase_price - discount
  end
end
