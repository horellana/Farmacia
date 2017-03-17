class SearchLaboratoryController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:search_laboratory_field]
    @laboratories = Laboratory.match_name(query)
    respond_to :js
  end
end
