class SearchProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart

  def index
    query = params[:product_name]
    @product, @equivalents = SearchProductService.new(query).call
  end
end
