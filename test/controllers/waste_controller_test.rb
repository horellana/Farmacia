require 'test_helper'

class WasteControllerTest < ActionDispatch::IntegrationTest
  test "no funciona sin iniciar sesion" do
    get wastes_path
    assert_response :redirect
  end

  test "Se puede crear una merma" do
    sign_in(users(:one))

    product = Product.first

    original_product_stock = product.stock
    original_wastes_count = Waste.count

    post(wastes_path,
         params: { waste: {amount: 1, description: 'vencidos', date: Time.now },
                   office_address: Office.first.address,
                   product_code: product.code })

    assert_equal original_wastes_count + 1, Waste.count
    assert_equal original_product_stock - 1, Product.first.stock
  end
end
