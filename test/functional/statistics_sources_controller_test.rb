require 'test_helper'

class StatisticsSourcesControllerTest < ActionController::TestCase
  setup do
    @statistics_source = statistics_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statistics_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statistics_source" do
    assert_difference('StatisticsSource.count') do
      post :create, statistics_source: { process_manager_id: @statistics_source.process_manager_id, source_path: @statistics_source.source_path, statistics_source_type_id: @statistics_source.statistics_source_type_id }
    end

    assert_redirected_to statistics_source_path(assigns(:statistics_source))
  end

  test "should show statistics_source" do
    get :show, id: @statistics_source
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @statistics_source
    assert_response :success
  end

  test "should update statistics_source" do
    put :update, id: @statistics_source, statistics_source: { process_manager_id: @statistics_source.process_manager_id, source_path: @statistics_source.source_path, statistics_source_type_id: @statistics_source.statistics_source_type_id }
    assert_redirected_to statistics_source_path(assigns(:statistics_source))
  end

  test "should destroy statistics_source" do
    assert_difference('StatisticsSource.count', -1) do
      delete :destroy, id: @statistics_source
    end

    assert_redirected_to statistics_sources_path
  end
end
