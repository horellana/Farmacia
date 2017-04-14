class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def increase_quantity(n=1)
    logger.info "Disminuyendo el stock de #{product.name} en #{n} unidades"
    product.decrease_stock(n)

    if product.valid?
      logger.info "El producto es valido"
      logger.info "Aumentando la cantidad de #{product.name} en el carro"
      self.quantity += n
      save!
    else
      logger.info "El producto no es valido"
      logger.info "Restaurando su stock"
      product.increase_stock(n)
    end
  end

  def decrease_quantity(n=1)
    self.quantity -= n

    if save
      product.increase_stock(n)
      product.save
      destroy! if self.quantity <= 0
    else
      self.quantity += n
    end
  end

  def drop
    decrease_quantity(quantity)
  end
end
