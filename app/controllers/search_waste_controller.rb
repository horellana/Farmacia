class SearchWasteController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:search_waste_field]

    puts "LOGGGGING: queery = #{query} LOGGGGING!!!"

    @wastes = Waste.match_code(query)
    respond_to :js
  end
end
