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
        @medicinal_ingredient.save!
  end
end