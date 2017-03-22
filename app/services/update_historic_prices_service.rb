class UpdateHistoricPricesService
  def initialize(product, params)
    @product = product
    @params = params
  end

  def call
    new_price = @params[:product][:sale_price]

    puts(
      "Actualizando el historico de precios de #{@product.name}. #{@product.sale_price} => #{new_price}"
    )

    if new_price != @product.sale_price
      HistoricPrice.create(product: @product,
                           priceold: @product.sale_price,
                           pricelast: new_price,
                           change: Time.now)
    end
  end
end
