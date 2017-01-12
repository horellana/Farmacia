require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  test 'no se puede crear un producto sin iniciar sesion' do
    get new_product_path
    assert_response :redirect
    assert_redirected_to new_user_session_path


    post products_path
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test 'se puede crear un producto' do
    sign_in users(:one)

    post products_path,
         params: { product: { name: 'foobar',
                              sale_price: 9999,
                              purchase_price: 555,
                              exempt: 'si',
                              commission: 5,
                              discount: 22,
                              description: 'descripcion'
                               },

                   stock: 5,
                   minimum_stock: 2,
                   provider_name: providers(:one).name,
                   medicinal_ingredient_name: medicinal_ingredients(:one).name,
                   dose_kind: doses(:one).kind,
                   product_be: '1',
                   product_isp: '1',
                   category_description: categories(:one).description }

    assert_response :redirect
    assert_redirected_to product_path(3)
  end
end
