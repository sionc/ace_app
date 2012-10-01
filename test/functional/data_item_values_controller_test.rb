require 'test_helper'

class DataItemValuesControllerTest < ActionController::TestCase
  setup do
    @data_item_value = data_item_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_item_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_item_value" do
    assert_difference('DataItemValue.count') do
      post :create, data_item_value: { current_value: @data_item_value.current_value, data_item_id: @data_item_value.data_item_id }
    end

    assert_redirected_to data_item_value_path(assigns(:data_item_value))
  end

  test "should show data_item_value" do
    get :show, id: @data_item_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @data_item_value
    assert_response :success
  end

  test "should update data_item_value" do
    put :update, id: @data_item_value, data_item_value: { current_value: @data_item_value.current_value, data_item_id: @data_item_value.data_item_id }
    assert_redirected_to data_item_value_path(assigns(:data_item_value))
  end

  test "should destroy data_item_value" do
    assert_difference('DataItemValue.count', -1) do
      delete :destroy, id: @data_item_value
    end

    assert_redirected_to data_item_values_path
  end
end
