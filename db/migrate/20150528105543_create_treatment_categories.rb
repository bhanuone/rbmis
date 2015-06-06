class CreateTreatmentCategories < ActiveRecord::Migration
  def change
    create_table :treatment_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
