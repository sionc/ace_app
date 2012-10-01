require 'test_helper'

class StatisticsSourceTypesControllerTest < ActionController::TestCase
  setup do
    @statistics_source_type = statistics_source_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statistics_source_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statistics_source_type" do
    assert_difference('StatisticsSourceType.count') do
      post :create, statistics_source_type: { name: @statistics_source_type.name }
    end

    assert_redirected_to statistics_source_type_path(assigns(:statistics_source_type))
  end

  test "should show statistics_source_type" do
    get :show, id: @statistics_source_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @statistics_source_type
    assert_response :success
  end

  test "should update statistics_source_type" do
    put :update, id: @statistics_source_type, statistics_source_type: { name: @statistics_source_type.name }
    assert_redirected_to statistics_source_type_path(assigns(:statistics_source_type))
  end

  test "should destroy statistics_source_type" do
    assert_difference('StatisticsSourceType.count', -1) do
      delete :destroy, id: @statistics_source_type
    end

    assert_redirected_to statistics_source_types_path
  end
end
