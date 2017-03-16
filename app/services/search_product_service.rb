class SearchProductService
  def initialize(query)
    @query = query
  end

  def call
    product = Product.find_by(code: @query) || Product.find_by(name: @query)

    if product
      equivalents = Product
                    .where(medicinal_ingredient: product.medicinal_ingredient)
                    .where.not(id: product.id)

      return product, equivalents
    end
  end
end
