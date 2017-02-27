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
                         gender: params[:client][:gender],
                         birth: params[:client][:birth],
                         kind: params[:client][:kind],
                        )
    if @client.save
      redirect_to @client
    else
    end
  end
  
  def edit
    @client = Client.find(params[:id])
  end
  
  def update
    @client = Client.find(params[:id])
   
    if @client.update(client_params)
      redirect_to @client
    else
      render 'edit'
    end
  end


  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    redirect_to clients_path
  end

 
  private
    def client_params
      params.require(:client).permit(:name, :lastname, :rut, :email, :address,
                                     :gender, :birth, :kind)
  end

end
