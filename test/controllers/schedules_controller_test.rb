require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule" do
    assert_difference('Schedule.count') do
      post :create, schedule: { doctor_id: @schedule.doctor_id, friday_morning_from: @schedule.friday_morning_from, friday_morning_to: @schedule.friday_morning_to, friday_noon_from: @schedule.friday_noon_from, friday_noon_to: @schedule.friday_noon_to, hospital_id: @schedule.hospital_id, monday_morning_from: @schedule.monday_morning_from, monday_morning_to: @schedule.monday_morning_to, monday_noon_from: @schedule.monday_noon_from, monday_noon_to: @schedule.monday_noon_to, saturday_morning_from: @schedule.saturday_morning_from, saturday_morning_to: @schedule.saturday_morning_to, saturday_noon_from: @schedule.saturday_noon_from, saturday_noon_to: @schedule.saturday_noon_to, sunday_morning_from: @schedule.sunday_morning_from, sunday_morning_to: @schedule.sunday_morning_to, sunday_noon_from: @schedule.sunday_noon_from, sunday_noon_to: @schedule.sunday_noon_to, thursday_morning_from: @schedule.thursday_morning_from, thursday_morning_to: @schedule.thursday_morning_to, thursday_noon_from: @schedule.thursday_noon_from, thursday_noon_to: @schedule.thursday_noon_to, tuesday_morning_from: @schedule.tuesday_morning_from, tuesday_morning_to: @schedule.tuesday_morning_to, tuesday_noon_from: @schedule.tuesday_noon_from, tuesday_noon_to: @schedule.tuesday_noon_to, wednesday_morning_from: @schedule.wednesday_morning_from, wednesday_morning_to: @schedule.wednesday_morning_to, wednesday_noon_from: @schedule.wednesday_noon_from, wednesday_noon_to: @schedule.wednesday_noon_to }
    end

    assert_redirected_to schedule_path(assigns(:schedule))
  end

  test "should show schedule" do
    get :show, id: @schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule
    assert_response :success
  end

  test "should update schedule" do
    patch :update, id: @schedule, schedule: { doctor_id: @schedule.doctor_id, friday_morning_from: @schedule.friday_morning_from, friday_morning_to: @schedule.friday_morning_to, friday_noon_from: @schedule.friday_noon_from, friday_noon_to: @schedule.friday_noon_to, hospital_id: @schedule.hospital_id, monday_morning_from: @schedule.monday_morning_from, monday_morning_to: @schedule.monday_morning_to, monday_noon_from: @schedule.monday_noon_from, monday_noon_to: @schedule.monday_noon_to, saturday_morning_from: @schedule.saturday_morning_from, saturday_morning_to: @schedule.saturday_morning_to, saturday_noon_from: @schedule.saturday_noon_from, saturday_noon_to: @schedule.saturday_noon_to, sunday_morning_from: @schedule.sunday_morning_from, sunday_morning_to: @schedule.sunday_morning_to, sunday_noon_from: @schedule.sunday_noon_from, sunday_noon_to: @schedule.sunday_noon_to, thursday_morning_from: @schedule.thursday_morning_from, thursday_morning_to: @schedule.thursday_morning_to, thursday_noon_from: @schedule.thursday_noon_from, thursday_noon_to: @schedule.thursday_noon_to, tuesday_morning_from: @schedule.tuesday_morning_from, tuesday_morning_to: @schedule.tuesday_morning_to, tuesday_noon_from: @schedule.tuesday_noon_from, tuesday_noon_to: @schedule.tuesday_noon_to, wednesday_morning_from: @schedule.wednesday_morning_from, wednesday_morning_to: @schedule.wednesday_morning_to, wednesday_noon_from: @schedule.wednesday_noon_from, wednesday_noon_to: @schedule.wednesday_noon_to }
    assert_redirected_to schedule_path(assigns(:schedule))
  end

  test "should destroy schedule" do
    assert_difference('Schedule.count', -1) do
      delete :destroy, id: @schedule
    end

    assert_redirected_to schedules_path
  end
end
