class TicketsController < ApplicationController
  before_action :authenticate_user!

  def show
    @transaction = Transaction.find_by_id(params[:id])

    unless @transaction
      return redirect_back(fallback_location: root_path, alert: 'Venta no encontrada')
    end

    return render 'show.txt.erb', layout: false
  end
end
