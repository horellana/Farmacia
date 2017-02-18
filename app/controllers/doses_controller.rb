class DosesController < ApplicationController
     autocomplete :dose, :kind
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
 
  
  
 def edit
    @dose = Dose.find(params[:id])
  end
  
def update
  @dose = Dose.find(params[:id])
 
  if @dose.update(dose_params)
    redirect_to @dose
  else
    render 'edit'
  end
end


  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to doses_path
  end



 
  private
    def dose_params
      params.require(:dose).permit(:kind, :quantity)
  end
end