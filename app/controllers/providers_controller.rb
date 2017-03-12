class ProvidersController < ApplicationController
  autocomplete :provider, :name
  before_action :authenticate_user!

  before_action :admin_only, except: [:index, :show]

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
      flash[:notice] = "Proveedor creado con exito"
      redirect_to @provider
    else
      render :action => 'new'
    end
  end



  def edit
    @provider = Provider.find(params[:id])
  end

  def update
    @provider = Provider.find(params[:id])

    if @provider.update(provider_params)
      redirect_to @provider
    else
      render 'edit'
    end
  end


  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy

    redirect_to providers_path
  end


  private
  def provider_params
    params.require(:provider).permit(:name, :rut, :business_name, :address, :phone_one, :phone_two,
                                     :email, :web,:observation)
  end

end
