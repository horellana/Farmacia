class SearchProductController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart

  def index
    query = params[:product_name]
    @product, @equivalents = SearchProductService.new(query).call

    puts "@product = #{@product}"
    puts "@equivalents = #{@equivalents}"

    puts "@product.stock"

    respond_to :js
  end
end
