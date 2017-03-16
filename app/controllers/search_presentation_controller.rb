class SearchPresentationController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:search_presentation_field]
    @presentations = Presentation.match_name(query)
    respond_to :js
  end
end
