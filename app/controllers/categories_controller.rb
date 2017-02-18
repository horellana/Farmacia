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
   
   
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
   
    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end


  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end



 
  private
    def category_params
      params.require(:category).permit(:description)
  end
 
end