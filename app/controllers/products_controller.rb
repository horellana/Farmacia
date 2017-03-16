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
<<<<<<< HEAD
    @product = Product.new
    @product = create_from_form(@product, params)
=======
    category = Category.find_by description: params[:category_descripcion]
    ingredient = MedicinalIngredient.find_by name: params[:product][:medicinal_ingredient_id]
    provider = Provider.find_by name: params[:product][:provider_id]
    presentation = presentation.find_by kind: params[:product][:presentation_id]

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
    @product.presentation = presentation
    @product.inventory = inventory
>>>>>>> b6b59ecb1a7a4f6fe9636cc0b9a3439f3bcdbbf4

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

    set_attributes_from_form(@product, params)
    @product.inventory.stock = params[:stock]
    @product.inventory.minimum_stock = params[:minimum_stock]


    if @product.save
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

  def set_attributes_from_form(product, params)
    product.name = params[:product][:name]
    product.description = params[:product][:description]
    product.sale_price = params[:product][:sale_price]
    product.purchase_price = params[:product][:purchase_price]
    product.be = params[:product_be]
    product.isp = params[:product_isp]
    product.isp = false if not product.isp
    product.discount = params[:product][:discount].to_i
  end

  def get_relations_from_form(product, params)
    product.category = Category.find_by description: params[:category_descripcion]
    product.medicinal_ingredient = MedicinalIngredient.find_by name: params[:product][:medicinal_ingredient_id]
    product.provider = Provider.find_by name: params[:product][:provider_id]
    product.dose = Dose.find_by kind: params[:product][:dose_id]
  end

  def create_from_form(product, params)
    get_relations_from_form(product, params)
    set_attributes_from_form(product, params)

    inventory = Inventory.new stock: params[:stock],
                              minimum_stock: params[:minimum_stock],
                              office: current_office

    product.inventory = inventory

    return product
  end

  def product_params
    params
      .require(:product)
      .permit(:name, :description, :sale_price, :purchase_price,
              :be, :isp, :discount, :description)
  end
end
