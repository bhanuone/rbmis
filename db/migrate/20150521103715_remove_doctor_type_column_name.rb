class RemoveDoctorTypeColumnName < ActiveRecord::Migration
  
  def change
    remove_column :doctors, :doctor_type
  end
end
