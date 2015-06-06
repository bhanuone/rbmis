class Admin::DiagnosticFacilitiesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_diagnostic_facility, only: [:show, :edit, :update, :destroy]

  # GET /diagnostic_facilities
  # GET /diagnostic_facilities.json
  def index
    @diagnostic_facilities = DiagnosticFacility.all
  end

  # GET /diagnostic_facilities/1
  # GET /diagnostic_facilities/1.json
  def show
  end

  # GET /diagnostic_facilities/new
  def new
    @diagnostic_facility = DiagnosticFacility.new
  end

  # GET /diagnostic_facilities/1/edit
  def edit
  end

  # POST /diagnostic_facilities
  # POST /diagnostic_facilities.json
  def create
    @diagnostic_facility = DiagnosticFacility.new(diagnostic_facility_params)

    respond_to do |format|
      if @diagnostic_facility.save
        format.html { redirect_to @diagnostic_facility, notice: 'Diagnostic facility was successfully created.' }
        format.json { render :show, status: :created, location: @diagnostic_facility }
      else
        format.html { render :new }
        format.json { render json: @diagnostic_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diagnostic_facilities/1
  # PATCH/PUT /diagnostic_facilities/1.json
  def update
    respond_to do |format|
      if @diagnostic_facility.update(diagnostic_facility_params)
        format.html { redirect_to @diagnostic_facility, notice: 'Diagnostic facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @diagnostic_facility }
      else
        format.html { render :edit }
        format.json { render json: @diagnostic_facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnostic_facilities/1
  # DELETE /diagnostic_facilities/1.json
  def destroy
    @diagnostic_facility.destroy
    respond_to do |format|
      format.html { redirect_to diagnostic_facilities_url, notice: 'Diagnostic facility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagnostic_facility
      @diagnostic_facility = DiagnosticFacility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diagnostic_facility_params
      params.require(:diagnostic_facility).permit(:name)
    end
end
