class ClientsController < ApplicationController
  autocomplete :client, :name
  autocomplete :client, :rut

  before_action :authenticate_user!

  def new
    @client = Client.new
  end

  def index
    @client = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end


  def create
    @client = Client.new(name: params[:client][:name],
                         lastname: params[:client][:lastname],
                         rut: params[:client][:rut],
                         email: params[:client][:email],
                         address: params[:client][:address],
                        )
    if @client.save
      redirect_to @client
    else

    end
  end

end
