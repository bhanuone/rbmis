class CreateStates < ActiveRecord::Migration
  
  def up
    create_table :states do |t|
      t.string :name
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :states
  end
end
