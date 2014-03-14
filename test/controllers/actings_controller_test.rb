require 'test_helper'

class ActingsControllerTest < ActionController::TestCase
  setup do
    @acting = actings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acting" do
    assert_difference('Acting.count') do
      post :create, acting: { activity_id: @acting.activity_id, user_id: @acting.user_id }
    end

    assert_redirected_to acting_path(assigns(:acting))
  end

  test "should show acting" do
    get :show, id: @acting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acting
    assert_response :success
  end

  test "should update acting" do
    patch :update, id: @acting, acting: { activity_id: @acting.activity_id, user_id: @acting.user_id }
    assert_redirected_to acting_path(assigns(:acting))
  end

  test "should destroy acting" do
    assert_difference('Acting.count', -1) do
      delete :destroy, id: @acting
    end

    assert_redirected_to actings_path
  end
end
