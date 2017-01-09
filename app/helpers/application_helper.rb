module ApplicationHelper
  def box_open?
    Box.get_box.active
  end

  def current_box_movement
    BoxMovement.last if box_open?
  end
end
