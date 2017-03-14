class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def increase_quantity(n=1)
    puts "Disminuyendo el stock de #{product.name} en #{n} unidades"
    product.decrease_stock(n)

    if product.valid?
      self.quantity += n
      save!
    else
      puts "El producto #{product.name} no es valido"
      puts "Aumentando el stock de #{product.name} en #{n} unidades"
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
