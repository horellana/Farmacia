class OfficesController < ApplicationController
  autocomplete :office, :address

  before_action :authenticate_user!

  def new
    @office = Office.new
  end

  def index
    @office = Office.all
  end

  def show
    @office = Office.find(params[:id])
  end


  def create
    puts "#{params[:office][:hour_in]}"


    @office = Office.new(address: params[:office][:address],
                         sii_code: params[:office][:sii_code],
                         phone: params[:office][:phone],
                         description: params[:office][:description],
                         # hour_in: params[:office][:hour_in],
                         # hour_out: params[:office][:hour_out],
                        )

    hora_entrada = params[:office]['hour_in(4i)']
    min_entrada = params[:office]['hour_in(5i)']

    hora_salida = params[:office]['hour_out(4i)']
    min_salida = params[:office]['hour_out(5i)']

    @office.hour_in = Time.parse(DateTime.parse("#{hora_entrada}:#{min_entrada}").to_s)
    @office.hour_out = Time.parse(DateTime.parse("#{hora_salida}:#{min_salida}").to_s)

    if @office.save
      flash[:notice] = "Cliente creado con exito"
      redirect_to @office
    else
      render :action => 'new'
    end
  end

  def edit
    @office = Office.find(params[:id])
  end

  def update
    @office = Office.find(params[:id])

    if @office.update(office_params)
      redirect_to @office
    else
      render 'edit'
    end
  end


  def destroy
    @office = Office.find(params[:id])

    begin
      @office.destroy
    rescue ActiveRecord::InvalidForeignKey
      return redirect_to root_path, alert: 'Esta Sucursal esta activa o genero ventas, no es posible eliminarlo'
    end

    redirect_to root_path, notice: 'Sucursal eliminada'
  end


  private
  def office_params
    params.require(:office).permit(:address, :sii_code, :phone, :description , :hour_in, :hour_out)
  end

end
