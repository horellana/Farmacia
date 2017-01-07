class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def increase_quantity
    self.quantity = self.quantity + 1
    self.product.decrease_stock
    self.save!
  end

  def decrease_quantity
    self.quantity = self.quantity - 1
    self.product.increase_stock
    self.save!

    if self.quantity <= 0
      self.destroy!
    end
  end
end
