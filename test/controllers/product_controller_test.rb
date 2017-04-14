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
         params:
           { product: { code: '999220',
                        name: 'new_product_name',
                        isp: 'new_product_isp',
                        description: 'new_product_description',
                        be: "0",
                        discount: 50,
                        purchase_price: 100,
                        sale_price: 200,
                        inventory_attributes:
                          { stock: 5,
                            minimum_stock: 5 },
                        category_attributes:
                          { description: categories(:one).description },
                        presentation_attributes:
                          { name: presentations(:one).name },
                        laboratory_attributes:
                          { name: laboratories(:one).name },
                        provider_attributes:
                          { name: providers(:one).name },
                        principles_string: 'paracetamol' } }


    # assert_response :redirect
    assert_redirected_to product_path(Product.last)
  end

  test 'funciona el autocompletar' do
    sign_in users(:one)

    get autocomplete_product_name_products_path,
        params: { query: 'ibu' }

    assert_response :success
  end
end
