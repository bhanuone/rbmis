class CreateHospitalsSpecialitiesJoinTable < ActiveRecord::Migration
  
  def up
    create_join_table :hospitals, :specialities, id: false do |t|
      t.integer :hospital_id
      t.integer :speciality_id
    end
    add_index :hospitals_specialities, [:hospital_id, :speciality_id]
  end

  def down
    drop_table :hospitals_specialities
  end

end
