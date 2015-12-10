require 'test_helper'

class LearningLogsControllerTest < ActionController::TestCase
  setup do
    @learning_log = learning_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learning_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learning_log" do
    assert_difference('LearningLog.count') do
      post :create, learning_log: { learned_word: @learning_log.learned_word, user_id: @learning_log.user_id }
    end

    assert_redirected_to learning_log_path(assigns(:learning_log))
  end

  test "should show learning_log" do
    get :show, id: @learning_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @learning_log
    assert_response :success
  end

  test "should update learning_log" do
    patch :update, id: @learning_log, learning_log: { learned_word: @learning_log.learned_word, user_id: @learning_log.user_id }
    assert_redirected_to learning_log_path(assigns(:learning_log))
  end

  test "should destroy learning_log" do
    assert_difference('LearningLog.count', -1) do
      delete :destroy, id: @learning_log
    end

    assert_redirected_to learning_logs_path
  end
end
