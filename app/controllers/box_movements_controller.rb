class BoxMovementsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def new
    @box_movement = BoxMovement.new
  end

  def show
    @box_movement = BoxMovement.last
  end

  def create
    @box_movement = BoxMovement.new
    @box_movement.start_amount = params[:box_movement][:start_amount]
    @box_movement.start_date = Time.now

    @box_movement.box = Box.get_box
    @box_movement.user = current_user

    @box_movement.box.active = true
    @box_movement.box.save!

    if @box_movement.valid?
      @box_movement.save
      redirect_to box_movement_path(@box_movement)
    else
      render :new
    end
  end

  def destroy
    @box_movement = BoxMovement.last
    @box_movement.box.active = false
    @box_movement.box.save!

    redirect_to root_path
  end
end
