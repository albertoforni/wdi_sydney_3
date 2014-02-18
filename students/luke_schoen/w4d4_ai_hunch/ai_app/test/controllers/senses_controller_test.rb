require 'test_helper'

class SensesControllerTest < ActionController::TestCase
  setup do
    @sense = senses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:senses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sense" do
    assert_difference('Sense.count') do
      post :create, sense: { description: @sense.description, image: @sense.image, name: @sense.name }
    end

    assert_redirected_to sense_path(assigns(:sense))
  end

  test "should show sense" do
    get :show, id: @sense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sense
    assert_response :success
  end

  test "should update sense" do
    patch :update, id: @sense, sense: { description: @sense.description, image: @sense.image, name: @sense.name }
    assert_redirected_to sense_path(assigns(:sense))
  end

  test "should destroy sense" do
    assert_difference('Sense.count', -1) do
      delete :destroy, id: @sense
    end

    assert_redirected_to senses_path
  end
end
