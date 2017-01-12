class DosesController < ApplicationController
     autocomplete :Category, :name
     before_action :authenticate_user!

  def new
    @dose = Dose.new
  end

  def index
    @doses = Dose.all
  end

  def show
    @dose = Dose.find(params[:id])
  end


  def create
        @dose = Dose.new(kind: params[:dose][:kind],
                         quantity: params[:dose][:quantity],)
           if @dose.save
            flash[:notice] = "Dosis Creada."
            redirect_to @dose
          else
            render :action => 'new'
          end
   end
 
end