class RutController < ApplicationController
  before_action :authenticate_user!

  def update
    session[:client_rut] = params[:set_rut]
  end
end
