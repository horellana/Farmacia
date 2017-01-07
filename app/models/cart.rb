class Cart < ApplicationRecord
  has_many :cart_items

  def empty?
    items.length == 0
  end

  def add(product)
    begin
      item = CartItem.find_by! cart: self, product: product
      item.increase_quantity
      return item
    rescue ActiveRecord::RecordNotFound
      item = CartItem.create! cart: self, product: product, quantity: 1
      item.product.decrease_stock
      return item
    end
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
