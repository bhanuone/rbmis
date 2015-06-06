class Admin::SchedulesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :get_unlinked_doctors_or_hospitals, only:[:create, :new]

  # GET /schedules
  # GET /schedules.json
  def index
    @add_doctor = 1
    if params[:hospital_id].present?
      @hospital = Hospital.includes(:doctors).find(params[:hospital_id])
      @schedule = Schedule.new
    else
      @add_doctor = 0
      @doctor = Doctor.includes(:hospitals).find(params[:doctor_id])
      @schedule = Schedule.new
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)
    @add_doctor = params[:schedule][:redirect].to_i
    if params[:schedule][:redirect] == "1"
      @hospital = Hospital.find(params[:schedule][:hospital_id])
      respond_to do |format|
        if @schedule.save
          format.html { redirect_to area_hospital_path(@hospital.area, @hospital), notice: 'Schedule was successfully created.' }
          format.json { render :show, status: :created, location: @schedule }
        else
          format.html { render :new }
          format.json { render json: @schedule.errors, status: :unprocessable_entity }
        end
      end
    else
      @doctor = Doctor.find(params[:schedule][:doctor_id])
      respond_to do |format|
        if @schedule.save
          format.html { redirect_to doctor_path(@doctor), notice: 'Schedule was successfully created.' }
          format.json { render :show, status: :created, location: @schedule }
        else
          format.html { render :new }
          format.json { render json: @schedule.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to doctor_path(params[:doctor_id]), notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.includes(:hospital, :doctor).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:hospital_id, :doctor_id, :sunday_morning_from, :sunday_morning_to, :sunday_noon_from, :sunday_noon_to, :monday_morning_from, :monday_morning_to, :monday_noon_from, :monday_noon_to, :tuesday_morning_from, :tuesday_morning_to, :tuesday_noon_from, :tuesday_noon_to, :wednesday_morning_from, :wednesday_morning_to, :wednesday_noon_from, :wednesday_noon_to, :thursday_morning_from, :thursday_morning_to, :thursday_noon_from, :thursday_noon_to, :friday_morning_from, :friday_morning_to, :friday_noon_from, :friday_noon_to, :saturday_morning_from, :saturday_morning_to, :saturday_noon_from, :saturday_noon_to)
    end

    def get_unlinked_doctors_or_hospitals
      @add_doctor = 1
      if params[:hospital_id].present? || (params[:schedule] && params[:schedule][:redirect] == 1)
        @hospital = Hospital.includes(:doctors, :area).find(params[:hospital_id])
        @unlinked_doctors = Doctor.all - @hospital.doctors
      else
        @add_doctor = 0
        @doctor = Doctor.includes(:hospitals).find(params[:doctor_id])
        @unlinked_hospitals = Hospital.all - @doctor.hospitals
      end
    end
end
