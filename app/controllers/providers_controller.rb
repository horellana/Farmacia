class ProvidersController < ApplicationController
  autocomplete :provider, :name
  before_action :authenticate_user!

  def new
    @provider = Provider.new
  end

  def index
    @provider = Provider.all
  end

  def show
    @provider = Provider.find(params[:id])
  end


  def create
        @provider = Provider.new(name: params[:provider][:name],
                        rut: params[:provider][:rut],
                        business_name: params[:provider][:business_name],
                        address: params[:provider][:address],
                        phone_one: params[:provider][:phone_one],
                        phone_two: params[:provider][:phone_two],
                        email: params[:provider][:email],
                        web: params[:provider][:web],
                        observation: params[:provider][:observation]
                        )
        if @provider.save
              redirect_to @provider
        else
            #  render 
        end
  end

end
