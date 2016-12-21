class SearchProductController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart

  def index
    query = params[:search_product_field]
    @products = Product.match_name(query)
    respond_to :js
  end
end
