class Admin::HospitalCategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_hospital_category, only: [:show, :edit, :update, :destroy]

  # GET /hospital_categories
  # GET /hospital_categories.json
  def index
    @hospital_categories = HospitalCategory.all
  end

  # GET /hospital_categories/1
  # GET /hospital_categories/1.json
  def show
  end

  # GET /hospital_categories/new
  def new
    @hospital_category = HospitalCategory.new
  end

  # GET /hospital_categories/1/edit
  def edit
  end

  # POST /hospital_categories
  # POST /hospital_categories.json
  def create
    @hospital_category = HospitalCategory.new(hospital_category_params)

    respond_to do |format|
      if @hospital_category.save
        format.html { redirect_to @hospital_category, notice: 'hospital_category was successfully created.' }
        format.json { render :show, status: :created, location: @hospital_category }
      else
        format.html { render :new }
        format.json { render json: @hospital_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospital_categories/1
  # PATCH/PUT /hospital_categories/1.json
  def update
    respond_to do |format|
      if @hospital_category.update(hospital_category_params)
        format.html { redirect_to @hospital_category, notice: 'hospital_category was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospital_category }
      else
        format.html { render :edit }
        format.json { render json: @hospital_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospital_categories/1
  # DELETE /hospital_categories/1.json
  def destroy
    @hospital_category.destroy
    respond_to do |format|
      format.html { redirect_to hospital_categories_url, notice: 'hospital_category was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital_category
      @hospital_category = HospitalCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospital_category_params
      params.require(:hospital_category).permit(:name)
    end
end
