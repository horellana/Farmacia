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
           if @category.save
            flash[:notice] = "Categoria Creada."
            redirect_to @category
          else
            render :action => 'new'
          end
   end
 
end