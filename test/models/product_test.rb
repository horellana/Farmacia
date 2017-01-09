require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'Los productos calculan su precio final' do
    product = products :paracetamol
    expected = product.sale_price - product.discount
    assert_equal expected, product.price
  end

  test 'Los productos calculan su ganancia' do
    product = products :paracetamol
    expected = product.price - product.purchase_price
    assert_equal expected, product.profit
  end

  test 'Busqueda de productos por nombre' do
    ibuprofeno = products :ibuprofeno
    paracetamol = products :paracetamol

    productos = Product.match_name('')

    assert_equal [paracetamol, ibuprofeno], productos,
                 'los resultados estan ordenados por ganancia'

    assert_equal [ibuprofeno], Product.match_name('ibu'),
                 'busca productos con una parte del nombre'

    assert_equal 2, Product.match_name('').length,
                 'Una busqueda vacia retorna todos los productos'
  end

  test 'Se puede obtener el stock de un producto' do
    assert_equal 7, products(:paracetamol).stock
    assert_equal 5, products(:ibuprofeno).stock
  end

  test 'Se puede aumentar el stock de un producto' do
    p = products(:paracetamol)

    p.increase_stock
    assert_equal 8, p.stock

    p.increase_stock(3)
    assert_equal 11, p.stock
  end

  test 'Se puede disminuir el stock de un producto' do
    p = products(:paracetamol)

    p.decrease_stock
    assert_equal 6, p.stock

    p.decrease_stock(3)
    assert_equal 3, p.stock
  end

  test 'el producto tiene validaciones' do
    product = Product.new
    assert_not product.valid?
  end
end
