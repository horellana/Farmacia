class SearchCategoryController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:search_category_field]
    @categories = Category.match_description(query)
    respond_to :js
  end
end
