class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :full_name
      t.string :practice_name
      t.string :email
      t.string :phone
      t.integer :experience
      t.boolean :verified

      t.timestamps null: false
    end
  end
end
