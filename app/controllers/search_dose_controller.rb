class SearchDoseController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:search_dose_field]
    @doses = Dose.match_name(query)
    respond_to :js
  end
end
