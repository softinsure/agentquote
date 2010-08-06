require 'test_helper'

class ConfigXmlsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:config_xmls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create config_xml" do
    assert_difference('ConfigXml.count') do
      post :create, :config_xml => { }
    end

    assert_redirected_to config_xml_path(assigns(:config_xml))
  end

  test "should show config_xml" do
    get :show, :id => config_xmls(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => config_xmls(:one).to_param
    assert_response :success
  end

  test "should update config_xml" do
    put :update, :id => config_xmls(:one).to_param, :config_xml => { }
    assert_redirected_to config_xml_path(assigns(:config_xml))
  end

  test "should destroy config_xml" do
    assert_difference('ConfigXml.count', -1) do
      delete :destroy, :id => config_xmls(:one).to_param
    end

    assert_redirected_to config_xmls_path
  end
end
