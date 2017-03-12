class MedicinalIngredientsController < ApplicationController
  autocomplete :medicinal_ingredient, :name
  before_action :authenticate_user!

  def new
    @medicinal_ingredient = MedicinalIngredient.new
  end

  def index
    @medicinal_ingredient = MedicinalIngredient.all
  end

  def show
    @medicinal_ingredient = MedicinalIngredient.find(params[:id])
  end


  def create
    @medicinal_ingredient = MedicinalIngredient.new(name: params[:medicinal_ingredient][:name],)
    if @medicinal_ingredient.save
      flash[:notice] = "Principio activo creado."
      redirect_to @medicinal_ingredient
    else
      render :action => 'new'
    end
  end

    def edit
    @medicinal_ingredient = MedicinalIngredient.find(params[:id])
  end

  def update
    @medicinal_ingredient = MedicinalIngredient.find(params[:id])

    if @medicinal_ingredient.update(medicinal_ingredient_params)
      redirect_to @medicinal_ingredient
    else
      render 'edit'
    end
  end


  def destroy
    @medicinal_ingredient = MedicinalIngredient.find(params[:id])
    @medicinal_ingredient.destroy

    redirect_to medicinal_ingredients_path
  end


  private
    def medicinal_ingredient_params
      params.require(:medicinal_ingredient).permit(:name)
  end

end
