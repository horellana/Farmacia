class CartPolicy < ApplicationPolicy
  def new?
    Box.get_box.active
  end
end
