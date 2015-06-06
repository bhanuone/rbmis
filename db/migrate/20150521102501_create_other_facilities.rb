class CreateOtherFacilities < ActiveRecord::Migration
  def change
    create_table :other_facilities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
