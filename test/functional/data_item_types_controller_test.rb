require 'test_helper'

class DataItemTypesControllerTest < ActionController::TestCase
  setup do
    @data_item_type = data_item_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_item_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_item_type" do
    assert_difference('DataItemType.count') do
      post :create, data_item_type: { default_value: @data_item_type.default_value, name: @data_item_type.name, unit: @data_item_type.unit }
    end

    assert_redirected_to data_item_type_path(assigns(:data_item_type))
  end

  test "should show data_item_type" do
    get :show, id: @data_item_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @data_item_type
    assert_response :success
  end

  test "should update data_item_type" do
    put :update, id: @data_item_type, data_item_type: { default_value: @data_item_type.default_value, name: @data_item_type.name, unit: @data_item_type.unit }
    assert_redirected_to data_item_type_path(assigns(:data_item_type))
  end

  test "should destroy data_item_type" do
    assert_difference('DataItemType.count', -1) do
      delete :destroy, id: @data_item_type
    end

    assert_redirected_to data_item_types_path
  end
end
