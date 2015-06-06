class CreateMedicalEquipments < ActiveRecord::Migration
  def change
    create_table :medical_equipments do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
