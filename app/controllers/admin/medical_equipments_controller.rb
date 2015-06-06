class Admin::MedicalEquipmentsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_medical_equipment, only: [:show, :edit, :update, :destroy]

  # GET /medical_equipments
  # GET /medical_equipments.json
  def index
    @medical_equipments = MedicalEquipment.all
  end

  # GET /medical_equipments/1
  # GET /medical_equipments/1.json
  def show
  end

  # GET /medical_equipments/new
  def new
    @medical_equipment = MedicalEquipment.new
  end

  # GET /medical_equipments/1/edit
  def edit
  end

  # POST /medical_equipments
  # POST /medical_equipments.json
  def create
    @medical_equipment = MedicalEquipment.new(medical_equipment_params)

    respond_to do |format|
      if @medical_equipment.save
        format.html { redirect_to @medical_equipment, notice: 'Medical equipment was successfully created.' }
        format.json { render :show, status: :created, location: @medical_equipment }
      else
        format.html { render :new }
        format.json { render json: @medical_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_equipments/1
  # PATCH/PUT /medical_equipments/1.json
  def update
    respond_to do |format|
      if @medical_equipment.update(medical_equipment_params)
        format.html { redirect_to @medical_equipment, notice: 'Medical equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @medical_equipment }
      else
        format.html { render :edit }
        format.json { render json: @medical_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_equipments/1
  # DELETE /medical_equipments/1.json
  def destroy
    @medical_equipment.destroy
    respond_to do |format|
      format.html { redirect_to medical_equipments_url, notice: 'Medical equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_equipment
      @medical_equipment = MedicalEquipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_equipment_params
      params.require(:medical_equipment).permit(:name)
    end
end
