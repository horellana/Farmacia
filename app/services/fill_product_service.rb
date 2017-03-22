class FillProductService
  def initialize(product, params)
    @product = product
    @params = params
  end

  def call
    set_attributes_from_form
    set_relations_from_form
    return @product
  end


  private

  def set_attributes_from_form
    @product.name = @params[:product][:name]
    @product.code = @params[:product][:code]
    @product.description = @params[:product][:description]
    @product.sale_price = @params[:product][:sale_price]
    @product.purchase_price = @params[:product][:purchase_price]
    @product.be = @params[:product][:be] == '1' ? true : false
    @product.isp = @params[:product][:isp]
    @product.discount = @params[:product][:discount].to_i
  end

  def set_relations_from_form
    @product.principles = Principle.from_string(@params[:product][:principles_string])

    @product.provider = Provider.find_by(name: @params[:product][:provider_attributes][:name])

    @product.presentation = Presentation.find_by(name: @params[:product][:presentation_attributes][:name])

    @product.category = Category.find_by(description: @params[:product][:category_attributes][:description])

    @product.laboratory = Laboratory.find_by(name: @params[:product][:laboratory_attributes][:name])

    @product
      .inventory
      .update(@params[:product][:inventory_attributes].permit(:stock, :minimum_stock))
  end
end
