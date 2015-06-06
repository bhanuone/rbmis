class AddTreatmentCategoryToSpeciality < ActiveRecord::Migration
  def change
    add_reference :specialities, :treatment_category, index: true, foreign_key: true
  end
end
