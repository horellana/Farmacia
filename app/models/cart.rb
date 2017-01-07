class Cart < ApplicationRecord
  has_many :cart_items

  def empty?
    items.empty?
  end

  def add(product)
    @item =
      begin
        CartItem.find_by! cart: self, product: product
      rescue ActiveRecord::RecordNotFound
        CartItem.create! cart: self, product: product
      end

    @item.increase_quantity
    @item
  end

  def items
    cart_items.order id: :desc
  end

  def total
    items
      .map { |item| item.product.price * item.quantity }
      .inject(0, :+)
  end

  def drop
    items.each(&:drop)
  end
end
