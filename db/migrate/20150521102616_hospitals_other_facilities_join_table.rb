class HospitalsOtherFacilitiesJoinTable < ActiveRecord::Migration
  
  def up
    create_table :hospitals_other_facilities, id: false do |t|
      t.references :hospital
      t.references :other_facility
    end
    add_index :hospitals_other_facilities, [:hospital_id, :other_facility_id], name: 'hospital_:other_facility_index'
  end

  def down
    remove_index :diagnostic_facilities_hospitals, [:hospital_id, :other_facility_id], name: 'hospital_:other_facility_index'
    drop_table :hospitals_other_facilities
  end

end
