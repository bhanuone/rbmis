class CreateSchedules < ActiveRecord::Migration
  
  def up
    create_table :schedules do |t|
      t.references :hospital, index: true, foreign_key: true
      t.references :doctor, index: true, foreign_key: true
      t.time :sunday_morning_from
      t.time :sunday_morning_to
      t.time :sunday_noon_from
      t.time :sunday_noon_to
      t.time :monday_morning_from
      t.time :monday_morning_to
      t.time :monday_noon_from
      t.time :monday_noon_to
      t.time :tuesday_morning_from
      t.time :tuesday_morning_to
      t.time :tuesday_noon_from
      t.time :tuesday_noon_to
      t.time :wednesday_morning_from
      t.time :wednesday_morning_to
      t.time :wednesday_noon_from
      t.time :wednesday_noon_to
      t.time :thursday_morning_from
      t.time :thursday_morning_to
      t.time :thursday_noon_from
      t.time :thursday_noon_to
      t.time :friday_morning_from
      t.time :friday_morning_to
      t.time :friday_noon_from
      t.time :friday_noon_to
      t.time :saturday_morning_from
      t.time :saturday_morning_to
      t.time :saturday_noon_from
      t.time :saturday_noon_to

      t.timestamps null: false
    end
    add_index :schedules, [:hospital_id, :doctor_id], unique:true
  end

  def down
    drop_table :schedules
  end
  
end
