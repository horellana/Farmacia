class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def increase_quantity(n=1)
    product.decrease_stock(n)

    if product.valid?
      self.quantity += n
      save!
    else
      product.increase_stock(n)
    end
  end

  def decrease_quantity(n=1)
    self.quantity -= n

    if save
      product.increase_stock(n)
      destroy! if self.quantity <= 0
    else
      self.quantity += n
    end
  end

  def drop
    decrease_quantity(quantity)
  end
end
