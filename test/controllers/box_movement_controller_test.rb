require 'test_helper'

class BoxMovementControllerTest < ActionDispatch::IntegrationTest
  test 'No se puede abrir una caja sin iniciar sesion' do
    get new_box_movement_path
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get index" do
    sign_in users(:one)

    get box_movements_path
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)

    get new_box_movement_path
    assert_response :success
  end

  test "should get create" do
    sign_in users(:one)

    post box_movements_path, params: { box_movement: { start_amount: 1111 } }
    assert_response :redirect
    assert_redirected_to box_movement_path(BoxMovement.last)
  end

  test "should get destroy" do
    sign_in users(:one)

    box_movement = BoxMovement.create box: boxes(:one), user: users(:one)

    delete box_movement_path(box_movement)
    assert_response :redirect
    assert_redirected_to root_path
  end
end
