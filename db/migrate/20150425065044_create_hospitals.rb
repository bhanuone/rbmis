class CreateHospitals < ActiveRecord::Migration
  
  def up
    create_table :hospitals do |t|
      t.string :name
      t.references :area, index: true, foreign_key: true
      t.text :address
      t.string :phone
      t.integer :bed_capacity, default: 0
      t.decimal :appointment_charge
      t.boolean :aarogyasri, default: false
      t.boolean :verified, default: false

      t.timestamps null: false
    end
  end

  def down
    drop_table :hospitals
  end

end
