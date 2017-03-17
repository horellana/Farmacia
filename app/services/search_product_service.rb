class SearchProductService
  def initialize(query)
    @query = query
  end

  def call
    product = Product.find_by(code: @query) || Product.find_by(name: @query)

    if product
      equivalents = Product
                    .where(id: PrincipleDetail
                            .select(:product_id)
                            .where(principle: product.principles))
                    .where.not(id: product)

      return product, equivalents
    end
  end
end
