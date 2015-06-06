class AddWorkingHoursToHospital < ActiveRecord::Migration

  def change
    add_column :hospitals, :opens_at, :time
    add_column :hospitals, :closes_at, :time
    add_column :hospitals, :full_time, :boolean, index: true
  end

end
