class HospitalsMedicalEquipmentsJoinTable < ActiveRecord::Migration

  def up
    create_join_table :hospitals, :medical_equipments, id: false do |t|
      t.references :hospital
      t.references :medical_equipment
    end
    add_index :hospitals_medical_equipments, [:hospital_id, :medical_equipment_id], name: 'hospitals_medical_equipments_index'
  end

  def down
    drop_table :hospitals_medical_equipments
  end
  
end
