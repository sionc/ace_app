require 'test_helper'

class ProcessManagersControllerTest < ActionController::TestCase
  setup do
    @process_manager = process_managers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:process_managers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create process_manager" do
    assert_difference('ProcessManager.count') do
      post :create, process_manager: { workspace_path: @process_manager.workspace_path }
    end

    assert_redirected_to process_manager_path(assigns(:process_manager))
  end

  test "should show process_manager" do
    get :show, id: @process_manager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @process_manager
    assert_response :success
  end

  test "should update process_manager" do
    put :update, id: @process_manager, process_manager: { workspace_path: @process_manager.workspace_path }
    assert_redirected_to process_manager_path(assigns(:process_manager))
  end

  test "should destroy process_manager" do
    assert_difference('ProcessManager.count', -1) do
      delete :destroy, id: @process_manager
    end

    assert_redirected_to process_managers_path
  end
end
