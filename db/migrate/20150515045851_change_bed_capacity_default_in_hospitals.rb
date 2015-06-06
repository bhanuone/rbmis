class ChangeBedCapacityDefaultInHospitals < ActiveRecord::Migration
  
  def up
    change_column_default :hospitals, :bed_capacity, nil
  end

  def down
    change_column_default :hospitals, :bed_capacity, 0
  end
  
end
