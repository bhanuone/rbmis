class CreateHospitalCategories < ActiveRecord::Migration
  def change
    create_table :hospital_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
