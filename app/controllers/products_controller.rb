class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart
  before_action :admin_only, except: [:index, :show, :autocomplete_product_name]

  autocomplete :product, :name

  def new
    default_product
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

  def create
    default_product

    set_attributes_from_form
    set_relations_from_form

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

    set_attributes_from_form
    set_relations_from_form

    if @product.save
      redirect_to @product
    else
      default_product
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path, notice: 'Producto eliminado correctamente'
  end

  private

  def default_product
    @product ||= Product.new
    @product.provider ||= Provider.new
    @product.category ||= Category.new
    @product.laboratory ||= Laboratory.new
    @product.presentation ||= Presentation.new
    @product.inventory ||= Inventory.new
  end


  def set_attributes_from_form
    @product.name = params[:product][:name]
    @product.description = params[:product][:description]
    @product.sale_price = params[:product][:sale_price]
    @product.purchase_price = params[:product][:purchase_price]
    @product.be = params[:product][:be] == '1' ? true : false
    @product.isp = params[:product][:isp]
    @product.discount = params[:product][:discount].to_i
  end

  def set_relations_from_form
    @product.principles = Principle.from_string(params[:product][:principles_string])
    @product.provider = Provider.find_by(name: params[:product][:provider_attributes][:name])
    @product.presentation = Presentation.find_by(name: params[:product][:presentation_attributes][:name])
    @product.category = Category.find_by(description: params[:product][:category_attributes][:description])
    @product.laboratory = Laboratory.find_by(name: params[:product][:laboratory_attributes][:name])

    @product
      .inventory
      .update(params[:product][:inventory_attributes].permit(:stock, :minimum_stock))
  end
end
