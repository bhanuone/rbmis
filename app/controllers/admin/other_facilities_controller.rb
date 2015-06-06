class Admin::OtherFacilitiesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_other_facility, only: [:show, :edit, :update, :destroy]

  # GET /other_facilities
  # GET /other_facilities.json
  def index
    @other_facilities = OtherFacility.all
  end

  # GET /other_facilities/1
  # GET /other_facilities/1.json
  def show
  end

  # GET /other_facilities/new
  def new
    @other_facility = OtherFacility.new
  end

  # GET /other_facilities/1/edit
  def edit
  end

  # POST /other_facilities
  # POST /other_facilities.json
  def create
    @other_facility = OtherFacility.new(other_facility_params)

    respond_to do |format|
      if @other_facility.save
        format.html { redirect_to @other_facility, notice: 'Other facility was successfully created.' }
        format.json { render :show, status: :created, location: @other_facility }
      else
        format.html { render :new }
        format.json { render json: @other_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_facilities/1
  # PATCH/PUT /other_facilities/1.json
  def update
    respond_to do |format|
      if @other_facility.update(other_facility_params)
        format.html { redirect_to @other_facility, notice: 'Other facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @other_facility }
      else
        format.html { render :edit }
        format.json { render json: @other_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_facilities/1
  # DELETE /other_facilities/1.json
  def destroy
    @other_facility.destroy
    respond_to do |format|
      format.html { redirect_to other_facilities_url, notice: 'Other facility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_facility
      @other_facility = OtherFacility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def other_facility_params
      params.require(:other_facility).permit(:name)
    end
end
