class BoxMovementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @box_movements = BoxMovement.all
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
      redirect_to box_movement_path(@box_movement), notice: 'Caja abierta'
    else
      render :new
    end
  end

  def destroy
    @box_movement = BoxMovement.last

    begin
      @box_movement.end_amount = params[:box_movement][:final_amount]
    rescue NoMethodError
      @box_movement.end_amount = @box_movement.final_amount
    end

    if @box_movement.valid?
      @box_movement.box.active = false
      @box_movement.box.save!
      @box_movement.save

      redirect_to root_path, notice: 'Caja cerrada'
    else
      render :show
    end
  end
end
