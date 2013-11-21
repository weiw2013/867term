require 'test_helper'

class CourseControllerTest < ActionController::TestCase
  test "should get add_one" do
    get :add_one
    assert_response :success
  end

  test "should get edit_one" do
    get :edit_one
    assert_response :success
  end

  test "should get delete_one" do
    get :delete_one
    assert_response :success
  end

  test "should get show_one" do
    get :show_one
    assert_response :success
  end

  test "should get show_all" do
    get :show_all
    assert_response :success
  end

end
