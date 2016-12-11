require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'Los productos calculan su precio final' do
    product = Product.find_by! name: 'Paracetamol'
    expected = product.sale_price - product.discount
    assert_equal expected, product.price
  end

  test 'Los productos calculan su ganancia' do
    product = Product.find_by! name: 'Paracetamol'
    expected = product.price - product.purchase_price
    assert_equal expected, product.profit
  end
end
