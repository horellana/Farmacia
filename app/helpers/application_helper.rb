module ApplicationHelper
  def cart?
    session[:cart_id]
  end

  def box_open?
    Box.get_box.active
  end

  def current_box_movement
    BoxMovement.last if box_open?
  end

  def can_sell?
    box_open? && cart?
  end

  def payment_method_options
    PaymentMethod.all.map { |pm| [pm.description, pm.id] }
  end
end
