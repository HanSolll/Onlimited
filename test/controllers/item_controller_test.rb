require 'test_helper'

class ItemControllerTest < ActionController::TestCase
  test "should get all" do
    get :all
    assert_response :success
  end

  test "should get brand" do
    get :brand
    assert_response :success
  end

  test "should get fashion" do
    get :fashion
    assert_response :success
  end

  test "should get cosmetic" do
    get :cosmetic
    assert_response :success
  end

  test "should get shoes" do
    get :shoes
    assert_response :success
  end

  test "should get ect" do
    get :ect
    assert_response :success
  end

end
