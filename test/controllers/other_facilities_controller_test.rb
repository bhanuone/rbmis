require 'test_helper'

class OtherFacilitiesControllerTest < ActionController::TestCase
  setup do
    @other_facility = other_facilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:other_facilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create other_facility" do
    assert_difference('OtherFacility.count') do
      post :create, other_facility: { name: @other_facility.name }
    end

    assert_redirected_to other_facility_path(assigns(:other_facility))
  end

  test "should show other_facility" do
    get :show, id: @other_facility
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @other_facility
    assert_response :success
  end

  test "should update other_facility" do
    patch :update, id: @other_facility, other_facility: { name: @other_facility.name }
    assert_redirected_to other_facility_path(assigns(:other_facility))
  end

  test "should destroy other_facility" do
    assert_difference('OtherFacility.count', -1) do
      delete :destroy, id: @other_facility
    end

    assert_redirected_to other_facilities_path
  end
end
