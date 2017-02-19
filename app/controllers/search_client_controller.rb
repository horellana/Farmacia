class SearchClientController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:search_cliente_field]
    @clients = Client.match_name(query)
    respond_to :js
  end
end
