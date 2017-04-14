require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'Los productos calculan su ganancia' do
    product = products :paracetamol
    expected = product.price - product.purchase_price - product.discount
    assert_equal expected, product.profit
  end

  test 'Busqueda de productos por nombre' do
    ibuprofeno = products(:ibuprofeno)

    assert_equal [ibuprofeno], Product.match_name('ibu'),
                 'busca productos con una parte del nombre'

    assert_equal Product.all.length, Product.match_name('').length,
                 'Una busqueda vacia retorna todos los productos'
  end

  test 'Se puede obtener el stock de un producto' do
    assert_equal 0, products(:paracetamol).stock
    assert_equal 5, products(:ibuprofeno).stock
  end

  test 'Se puede aumentar el stock de un producto' do
    p = products(:paracetamol)

    original_stock = p.stock

    p.increase_stock
    assert_equal original_stock + 1, p.stock

    p.increase_stock(3)
    assert_equal original_stock + 4, p.stock
  end

  test 'Se puede disminuir el stock de un producto' do
    p = products(:paracetamol)

    original_stock = p.stock

    p.decrease_stock
    assert_equal original_stock - 1, p.stock

    p.decrease_stock(3)
    assert_equal original_stock - 4, p.stock
  end

  test 'el producto tiene validaciones' do
    product = Product.new
    assert_not product.valid?
  end
end
