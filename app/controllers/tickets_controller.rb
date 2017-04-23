class TicketsController < ApplicationController
  before_action :authenticate_user!

  def show
    @transaction = Transaction.find params[:id]

    unless @transaction
      return redirect_back(root_path, alert: 'Venta no encontrada')
    end

    render 'show.txt.erb', layout: false
  end
end
