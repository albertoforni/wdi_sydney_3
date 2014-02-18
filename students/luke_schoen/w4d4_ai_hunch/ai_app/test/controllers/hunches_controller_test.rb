require 'test_helper'

class HunchesControllerTest < ActionController::TestCase
  setup do
    @hunch = hunches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hunches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hunch" do
    assert_difference('Hunch.count') do
      post :create, hunch: { description: @hunch.description, name: @hunch.name }
    end

    assert_redirected_to hunch_path(assigns(:hunch))
  end

  test "should show hunch" do
    get :show, id: @hunch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hunch
    assert_response :success
  end

  test "should update hunch" do
    patch :update, id: @hunch, hunch: { description: @hunch.description, name: @hunch.name }
    assert_redirected_to hunch_path(assigns(:hunch))
  end

  test "should destroy hunch" do
    assert_difference('Hunch.count', -1) do
      delete :destroy, id: @hunch
    end

    assert_redirected_to hunches_path
  end
end
