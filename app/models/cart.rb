class Cart < ApplicationRecord
  has_many :cart_items

  def empty?
    items.length == 0
  end

  def add(product)
    begin
      item = CartItem.find_by! cart: self, product: product
      item.increase_quantity
    rescue ActiveRecord::RecordNotFound
      CartItem.create! cart: self, product: product, quantity: 1
    end
  end

  def remove(product)
    CartItem
      .find_by(cart: self, product: product)
      .decrease_quantity
  end

  def items
    cart_items.order id: :desc
  end

  def total
    items
      .map { |item| item.product.price * item.quantity }
      .inject(0, :+)
  end
end
