require 'test_helper'

class MedicalEquipmentsControllerTest < ActionController::TestCase
  setup do
    @medical_equipment = medical_equipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_equipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_equipment" do
    assert_difference('MedicalEquipment.count') do
      post :create, medical_equipment: { name: @medical_equipment.name }
    end

    assert_redirected_to medical_equipment_path(assigns(:medical_equipment))
  end

  test "should show medical_equipment" do
    get :show, id: @medical_equipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medical_equipment
    assert_response :success
  end

  test "should update medical_equipment" do
    patch :update, id: @medical_equipment, medical_equipment: { name: @medical_equipment.name }
    assert_redirected_to medical_equipment_path(assigns(:medical_equipment))
  end

  test "should destroy medical_equipment" do
    assert_difference('MedicalEquipment.count', -1) do
      delete :destroy, id: @medical_equipment
    end

    assert_redirected_to medical_equipments_path
  end
end
