class DiagnosticFacilitiesHospitalsJoinTable < ActiveRecord::Migration
  
  def up
    create_table :diagnostic_facilities_hospitals, id: false do |t|
      t.references :hospital
      t.references :diagnostic_facility
    end
    add_index :diagnostic_facilities_hospitals, [:hospital_id, :diagnostic_facility_id], name: 'hospital_diagnostic_facility_index'
  end

  def down
    remove_index :diagnostic_facilities_hospitals, [:hospital_id, :diagnostic_facility_id], name: 'hospital_diagnostic_facility_index'
    drop_table :diagnostic_facilities_hospitals
  end
end
