require 'test_helper'

class GroupPermissionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_permissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_permission" do
    assert_difference('GroupPermission.count') do
      post :create, :group_permission => { }
    end

    assert_redirected_to group_permission_path(assigns(:group_permission))
  end

  test "should show group_permission" do
    get :show, :id => group_permissions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => group_permissions(:one).to_param
    assert_response :success
  end

  test "should update group_permission" do
    put :update, :id => group_permissions(:one).to_param, :group_permission => { }
    assert_redirected_to group_permission_path(assigns(:group_permission))
  end

  test "should destroy group_permission" do
    assert_difference('GroupPermission.count', -1) do
      delete :destroy, :id => group_permissions(:one).to_param
    end

    assert_redirected_to group_permissions_path
  end
end
