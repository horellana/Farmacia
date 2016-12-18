class NameController < ApplicationController
  before_action :authenticate_user!

  def update
    name = params[:data]
    session[:client_name] = name == '' ? nil : name
  end
end
