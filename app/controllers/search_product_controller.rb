class SearchProductController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart

  def index
    query = params[:product_name]

    @product = Product.find_by(name: query)
    @equivalents = Product
                   .where(medicinal_ingredient: @product.medicinal_ingredient)
                   .where.not(id: @product.id)

    respond_to :js

    # query = params[:product_medicinal_ingredient]

    # puts "query = #{query}"

    # mi = MedicinalIngredient.find_by name: query
    # puts "medicinal_ingredient found = #{mi}"


    # @products = Product.where medicinal_ingredient: mi

    # puts "@products = #{@products}"

    # respond_to :js
  end
end
