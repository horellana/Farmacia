class SearchOfficeController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:office_address]
    @offices = Office.match_address(query)
    respond_to :js
  end
end
