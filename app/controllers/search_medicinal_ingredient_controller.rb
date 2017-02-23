class SearchMedicinalIngredientController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:search_medicinal_ingredient_field]
    @medicinal_ingredients = MedicinalIngredient.match_name(query)
    respond_to :js
  end
end
