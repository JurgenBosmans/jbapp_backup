require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  setup do
    @todo = todos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:todos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create todo" do
    assert_difference('Todo.count') do
      post :create, todo: { beschrijving: @todo.beschrijving, naam: @todo.naam, start_datum: @todo.start_datum, stop_datum: @todo.stop_datum, user_id: @todo.user_id }
    end

    assert_redirected_to todo_path(assigns(:todo))
  end

  test "should show todo" do
    get :show, id: @todo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @todo
    assert_response :success
  end

  test "should update todo" do
    patch :update, id: @todo, todo: { beschrijving: @todo.beschrijving, naam: @todo.naam, start_datum: @todo.start_datum, stop_datum: @todo.stop_datum, user_id: @todo.user_id }
    assert_redirected_to todo_path(assigns(:todo))
  end

  test "should destroy todo" do
    assert_difference('Todo.count', -1) do
      delete :destroy, id: @todo
    end

    assert_redirected_to todos_path
  end
end
