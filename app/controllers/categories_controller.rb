class CategoriesController < ApplicationController
     autocomplete :Category, :name
     before_action :authenticate_user!

  def new
    @category = Category.new
  end

  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end


  def create
        @category = Category.new(description: params[:category][:description],)
        @category.save!
  end
end