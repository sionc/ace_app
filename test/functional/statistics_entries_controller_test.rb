require 'test_helper'

class StatisticsEntriesControllerTest < ActionController::TestCase
  setup do
    @statistics_entry = statistics_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statistics_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statistics_entry" do
    assert_difference('StatisticsEntry.count') do
      post :create, statistics_entry: { process_manager_id: @statistics_entry.process_manager_id }
    end

    assert_redirected_to statistics_entry_path(assigns(:statistics_entry))
  end

  test "should show statistics_entry" do
    get :show, id: @statistics_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @statistics_entry
    assert_response :success
  end

  test "should update statistics_entry" do
    put :update, id: @statistics_entry, statistics_entry: { process_manager_id: @statistics_entry.process_manager_id }
    assert_redirected_to statistics_entry_path(assigns(:statistics_entry))
  end

  test "should destroy statistics_entry" do
    assert_difference('StatisticsEntry.count', -1) do
      delete :destroy, id: @statistics_entry
    end

    assert_redirected_to statistics_entries_path
  end
end
