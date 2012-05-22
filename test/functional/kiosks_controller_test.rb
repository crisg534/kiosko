require 'test_helper'

class KiosksControllerTest < ActionController::TestCase
  setup do
    @kiosk = kiosks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kiosks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kiosk" do
    assert_difference('Kiosk.count') do
      post :create, kiosk: { image: @kiosk.image, nombre: @kiosk.nombre, precio: @kiosk.precio }
    end

    assert_redirected_to kiosk_path(assigns(:kiosk))
  end

  test "should show kiosk" do
    get :show, id: @kiosk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kiosk
    assert_response :success
  end

  test "should update kiosk" do
    put :update, id: @kiosk, kiosk: { image: @kiosk.image, nombre: @kiosk.nombre, precio: @kiosk.precio }
    assert_redirected_to kiosk_path(assigns(:kiosk))
  end

  test "should destroy kiosk" do
    assert_difference('Kiosk.count', -1) do
      delete :destroy, id: @kiosk
    end

    assert_redirected_to kiosks_path
  end
end
