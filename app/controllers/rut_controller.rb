class RutController < ApplicationController
  before_action :authenticate_user!

  def update
    rut = params[:data]
    session[:client_rut] = rut == '' ? nil : rut
  end
end
