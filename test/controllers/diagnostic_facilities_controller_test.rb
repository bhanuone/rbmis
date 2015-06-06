require 'test_helper'

class DiagnosticFacilitiesControllerTest < ActionController::TestCase
  setup do
    @diagnostic_facility = diagnostic_facilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diagnostic_facilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diagnostic_facility" do
    assert_difference('DiagnosticFacility.count') do
      post :create, diagnostic_facility: { name: @diagnostic_facility.name }
    end

    assert_redirected_to diagnostic_facility_path(assigns(:diagnostic_facility))
  end

  test "should show diagnostic_facility" do
    get :show, id: @diagnostic_facility
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @diagnostic_facility
    assert_response :success
  end

  test "should update diagnostic_facility" do
    patch :update, id: @diagnostic_facility, diagnostic_facility: { name: @diagnostic_facility.name }
    assert_redirected_to diagnostic_facility_path(assigns(:diagnostic_facility))
  end

  test "should destroy diagnostic_facility" do
    assert_difference('DiagnosticFacility.count', -1) do
      delete :destroy, id: @diagnostic_facility
    end

    assert_redirected_to diagnostic_facilities_path
  end
end
