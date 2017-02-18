class SearchProviderController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:search_provider_field]
    @provider = Provider.match_name(query)
    respond_to :js
  end
end
