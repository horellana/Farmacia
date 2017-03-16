class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart

  before_action :admin_only, except: [:index, :show, :autocomplete_product_name]

  autocomplete :product, :name

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

  def create
    category = Category.find_by description: params[:category_descripcion]
    ingredient = MedicinalIngredient.find_by name: params[:product][:medicinal_ingredient_id]
    provider = Provider.find_by name: params[:product][:provider_id]
    dose = Dose.find_by kind: params[:product][:dose_id]

    inventory = Inventory.new stock: params[:stock],
                              minimum_stock: params[:minimum_stock],
                              office: current_office

    @product = Product.new name: params[:product][:name],
                           description: params[:product][:description],
                           sale_price: params[:product][:sale_price],
                           purchase_price: params[:product][:purchase_price],
                           be: params[:product_be],
                           isp: params[:product_isp],
                           discount: params[:product][:discount].to_i

    @product.isp = false if not @product.isp

    @product.category = category
    @product.medicinal_ingredient = ingredient
    @product.provider = provider
    @product.dose = dose
    @product.inventory = inventory

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end


  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path, notice: 'Producto eliminado correctamente'
  end



  private

  def product_params
    params
      .require(:product)
      .permit(:name, :description, :sale_price, :purchase_price,
              :be, :isp, :discount, :description)
  end
end
