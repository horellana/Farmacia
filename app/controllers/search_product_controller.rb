class SearchProductController < ApplicationController
  before_action :setup_cart

  def index
    query = params[:search_product_field]
    @products = Product.where('name ilike ?', "%#{query}%")
    respond_to :js
  end
end
