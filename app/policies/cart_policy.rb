class CartPolicy < ApplicationPolicy.nil?
  def new?
    Box.get_box.active
  end
end
