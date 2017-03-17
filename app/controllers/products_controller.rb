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
    @product = Product.new
    @product = create_from_form(@product, params)

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
    product.category = Category.find_by(description: params[:category_descripcion])
    product.laboratory = Laboratory.find_by(name: params[:product][:laboratory_id])
    product.principles = Principle.from_string(params[:principles])
    product.provider = Provider.find_by(name: params[:product][:provider_id])
    product.presentation = Presentation.find_by(name: params[:presentation_id])
  end

  def create_from_form(product, params)
    get_relations_from_form(product, params)
    set_attributes_from_form(product, params)

    puts "minimum_stock = #{params[:minimum_stock]}"

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
