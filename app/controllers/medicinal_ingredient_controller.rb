class MedicinalIngredientController < ApplicationController
     autocomplete :medicinal_ingredient, :name
     before_action :authenticate_user!

  def new
    @medicinal_ingredient = Medicinal_ingredient.new
  end

  def index
    @medicinal_ingredient = Medicinal_ingredient.all
  end

  def show
    @medicinal_ingredient = Medicinal_ingredient.find(params[:id])
  end


  def create
        @medicinal_ingredient = Medicinal_ingredient.new(name: params[:medicinal_ingredient][:name],
                        )
        @medicinal_ingredient.save!
  end
end