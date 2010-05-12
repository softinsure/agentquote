require 'test_helper'

class LineOfBusinessesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_of_businesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_of_business" do
    assert_difference('LineOfBusiness.count') do
      post :create, :line_of_business => { }
    end

    assert_redirected_to line_of_business_path(assigns(:line_of_business))
  end

  test "should show line_of_business" do
    get :show, :id => line_of_businesses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => line_of_businesses(:one).to_param
    assert_response :success
  end

  test "should update line_of_business" do
    put :update, :id => line_of_businesses(:one).to_param, :line_of_business => { }
    assert_redirected_to line_of_business_path(assigns(:line_of_business))
  end

  test "should destroy line_of_business" do
    assert_difference('LineOfBusiness.count', -1) do
      delete :destroy, :id => line_of_businesses(:one).to_param
    end

    assert_redirected_to line_of_businesses_path
  end
end
