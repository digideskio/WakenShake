require 'test_helper'

class DancersControllerTest < ActionController::TestCase
  setup do
    @dancer = dancers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dancers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dancer" do
    assert_difference('Dancer.count') do
      post :create, dancer: { first_name: @dancer.first_name, last_name: @dancer.last_name }
    end

    assert_redirected_to dancer_path(assigns(:dancer))
  end

  test "should show dancer" do
    get :show, id: @dancer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dancer
    assert_response :success
  end

  test "should update dancer" do
    patch :update, id: @dancer, dancer: { first_name: @dancer.first_name, last_name: @dancer.last_name }
    assert_redirected_to dancer_path(assigns(:dancer))
  end

  test "should destroy dancer" do
    assert_difference('Dancer.count', -1) do
      delete :destroy, id: @dancer
    end

    assert_redirected_to dancers_path
  end
end
