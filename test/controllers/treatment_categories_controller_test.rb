require 'test_helper'

class TreatmentCategoriesControllerTest < ActionController::TestCase
  setup do
    @treatment_category = treatment_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:treatment_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create treatment_category" do
    assert_difference('TreatmentCategory.count') do
      post :create, treatment_category: { name: @treatment_category.name }
    end

    assert_redirected_to treatment_category_path(assigns(:treatment_category))
  end

  test "should show treatment_category" do
    get :show, id: @treatment_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @treatment_category
    assert_response :success
  end

  test "should update treatment_category" do
    patch :update, id: @treatment_category, treatment_category: { name: @treatment_category.name }
    assert_redirected_to treatment_category_path(assigns(:treatment_category))
  end

  test "should destroy treatment_category" do
    assert_difference('TreatmentCategory.count', -1) do
      delete :destroy, id: @treatment_category
    end

    assert_redirected_to treatment_categories_path
  end
end
