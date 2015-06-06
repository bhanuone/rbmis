class CreateAreas < ActiveRecord::Migration
  
  def up
    create_table :areas do |t|
      t.string :name
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :areas
  end
  
end
