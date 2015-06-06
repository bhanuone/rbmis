class Admin::DoctorsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.all
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
    if params[:hospital_id].present?
      @hospital = Hospital.find(params[:hospital_id])
      @doctor = @hospital.doctors.find(params[:id])
      @schedule = Schedule.where({hospital_id: params[:hospital_id], doctor_id: params[:id]}).first
      render :hospital_doctor_show
    end
  end

  # GET /doctors/new
  def new
    if params[:hospital_id].present?
      @hospital = Hospital.find(params[:hospital_id])
      @doctor = @hospital.doctors.new
      render :hospital_doctor_new
    else
      @doctor = Doctor.new
    end
  end

  # GET /doctors/1/edit
  def edit
    if params[:hospital_id].present?
      @hospital = Hospital.find(params[:hospital_id])
      @doctor = @hospital.doctors.includes(:schedules).find(params[:id])
      @schedule = @doctor.schedules.where({hospital_id: params[:hospital_id], doctor_id: params[:id]}).first
      render :hospital_doctor_edit
    else
      @doctor = Doctor.find(params[:id])
    end
  end

  # POST /doctors
  # POST /doctors.json
  def create
    info = {notice: 'Doctor was successfully created.'}
    if params[:hospital_id].present?
      @hospital = Hospital.find(params[:hospital_id])
      @doctor = @hospital.doctors.new(doctor_params)
      if @doctor.save
        params[:commit] == "Save" ? (redirect_to hospital_doctors_path(@hospital), info) : (redirect_to new_hospital_doctor_path(@hospital), info)
      else
        render :hospital_doctor_new
      end
    else
      @doctor = Doctor.new(doctor_params)
      respond_to do |format|
        if @doctor.save
          format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
          format.json { render :show, status: :created, location: @doctor }
        else
          format.html { render :new }
          format.json { render json: @doctor.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    if params[:hospital_id].present?
      @hospital = Hospital.includes(:area).find(params[:hospital_id])
      if @doctor.update(doctor_params)
        redirect_to area_hospital_path(@hospital.area, @hospital)
      else
        render :hospital_doctor_edit
      end
    else
      respond_to do |format|
        if @doctor.update(doctor_params)
          format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
          format.json { render :show, status: :ok, location: @doctor }
        else
          format.html { render :edit }
          format.json { render json: @doctor.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json

  def destroy
    @doctor.destroy
    if params[:hospital_id].present?
      @hospital = Hospital.find(params[:hospital_id])
      redirect_to hospital_doctors_url
    else
      respond_to do |format|
        format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def existing_doctor_form
    @hospital = Hospital.find(params[:hospital_id])
    @doctors_unlinked = (Doctor.all - @hospital.doctors).collect {|d| [d.full_name, d.id]}
    @schedule = Schedule.new
  end

  def unlink_hospital
    schedule = Schedule.where({hospital_id: params[:hospital_id], doctor_id: params[:id]}).first
    schedule.destroy
    redirect_to doctor_path(params[:id]), notice: 'Hospital unlinked'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.includes(:qualification, :specialization, :schedules, :hospitals).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:full_name, :avatar, :practice_name, :email, :phone, :experience, :verified, :qualification_id,
                        :specialization_id, schedules_attributes:[:id, :hospital_id, :doctor_id,
                                                                            :sunday_morning_from,
                                                                            :sunday_morning_to,
                                                                            :sunday_noon_from,
                                                                            :sunday_noon_to,
                                                                            :monday_morning_from,
                                                                            :monday_morning_to,
                                                                            :monday_noon_from,
                                                                            :monday_noon_to,
                                                                            :tuesday_morning_from,
                                                                            :tuesday_morning_to,
                                                                            :tuesday_noon_from,
                                                                            :tuesday_noon_to,
                                                                            :wednesday_morning_from,
                                                                            :wednesday_morning_to,
                                                                            :wednesday_noon_from,
                                                                            :wednesday_noon_to,
                                                                            :thursday_morning_from,
                                                                            :thursday_morning_to,
                                                                            :thursday_noon_from,
                                                                            :thursday_noon_to,
                                                                            :friday_morning_from,
                                                                            :friday_morning_to,
                                                                            :friday_noon_from,
                                                                            :friday_noon_to,
                                                                            :saturday_morning_from,
                                                                            :saturday_morning_to,
                                                                            :saturday_noon_from,
                                                                            :saturday_noon_to],
                                                                            doctor_category_ids:[])
      end
  end