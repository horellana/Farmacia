class SearchPrincipleController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:search_principles_field]
    @principles = Principle.match_name(query)
    respond_to :js
  end
end
