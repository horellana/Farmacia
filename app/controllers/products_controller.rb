class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart
  before_action :admin_only, except: [:index, :show, :autocomplete_product_name]

  autocomplete :product, :name

  def new
    @product = new_product
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

  def create
    @product = new_product

    set_attributes_from_form(@product, params)
    set_relations_from_form(@product, params)

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
    set_relations_from_form(@product, params)


    if @product.save
      redirect_to @product
    else
      new_product(@product)
      render :edit
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

  def set_relations_from_form(product, params)
    product.principles = Principle.from_string(params[:product][:principles_string])
    product.provider = Provider.find_by(name: params[:product][:provider_attributes][:name])
    product.presentation = Presentation.find_by(name: params[:product][:presentation_attributes][:name])
    product.category = Category.find_by(description: params[:product][:category_attributes][:description])
    product.laboratory = Laboratory.find_by(name: params[:product][:laboratory_attributes][:name])

    product
      .inventory
      .update(params[:product][:inventory_attributes].permit(:stock, :minimum_stock))

  end

  def create_from_form(product, params)
    set_relations_from_form(product, params)
    set_attributes_from_form(product, params)

    puts "minimum_stock = #{params[:minimum_stock]}"

    inventory = Inventory.new stock: params[:stock],
                              minimum_stock: params[:minimum_stock],
                              office: current_office

    product.inventory = inventory

    return product
  end

  def new_product(product=Product.new)
    product.provider ||= Provider.new
    product.category ||= Category.new
    product.laboratory ||= Laboratory.new
    product.presentation ||= Presentation.new
    product.inventory ||= Inventory.new

    return product
  end
end
