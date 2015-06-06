class HospitalCategoriesHospitalsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :hospitals, :hospital_categories, id: false do |t|
      t.index [:hospital_id, :hospital_category_id], name: 'hospital_categories_hospitals_index'
      # t.index [:hospital_category_id, :hospital_id]
    end
  end
end
