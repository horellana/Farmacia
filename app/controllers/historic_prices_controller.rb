class HistoricPricesController < ApplicationController
  def index
    @historic = HistoricPrice.all
  end
end
