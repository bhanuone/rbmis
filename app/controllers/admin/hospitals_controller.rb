class Admin::HospitalsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_hospital, only: [:show, :edit, :update, :destroy, :unlink_doctor]
  before_action :set_area

  # GET /hospitals
  # GET /hospitals.json

  def index
    @hospitals = @area.hospitals
  end

  # GET /hospitals/1
  # GET /hospitals/1.json
  def show
    @doctors_and_schedules = @hospital.doctors.zip(@hospital.schedules)
  end

  # GET /hospitals/new
  def new
    @hospital = @area.hospitals.new
  end

  # GET /hospitals/1/edit
  def edit
  end

  # POST /hospitals
  # POST /hospitals.json
  def create
    @hospital = @area.hospitals.new(hospital_params)
    respond_to do |format|
      if @hospital.save
        format.html { redirect_to area_hospital_path(@area, @hospital), notice: 'Hospital was successfully created.' }
        format.json { render :show, status: :created, location: @hospital }
      else
        format.html { render :new }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospitals/1
  # PATCH/PUT /hospitals/1.json
  def update
    respond_to do |format|
      if @hospital.update(hospital_params)
        format.html { redirect_to area_hospital_url, notice: 'Hospital was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospital }
      else
        format.html { render :edit }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitals/1
  # DELETE /hospitals/1.json
  def destroy
    @hospital.destroy
    respond_to do |format|
      format.html { redirect_to area_hospitals_url, notice: 'Hospital was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def unlink_doctor
    schedule = Schedule.where({hospital_id: params[:id], doctor_id: params[:doctor_id]}).first
    schedule.destroy
    redirect_to area_hospital_path(@area, @hospital), notice: 'Doctor unlinked'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital
      @hospital = Hospital.includes(:diagnostic_facilities, :other_facilities, :medical_equipments, :specialities, :schedules, :doctors).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospital_params
      params.require(:hospital).permit(:name, :area_id, :address, :phone, :bed_capacity, :appointment_charge, :aarogyasri, :verified,
                                        speciality_ids:[],
                                        medical_equipment_ids:[],
                                        other_facility_ids:[],
                                        diagnostic_facility_ids:[],
                                        hospital_category_ids:[])
    end

    def set_area
      params[:area_id].present? ? (@area = Area.includes(:city).find(params[:area_id])) : (@area = @hospital.area)
    end

end
