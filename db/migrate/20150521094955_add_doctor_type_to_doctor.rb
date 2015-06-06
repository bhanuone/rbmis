class AddDoctorTypeToDoctor < ActiveRecord::Migration

  def change
    add_column :doctors, :doctor_type, :boolean, default: false
  end

end
