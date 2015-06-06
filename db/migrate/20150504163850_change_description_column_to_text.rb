class ChangeDescriptionColumnToText < ActiveRecord::Migration

  def up
    remove_column :specialities, :description
    add_column :specialities, :description, :text
  end

  def down
    remove_column :specialities, :description
    add_column :specialities, :description, :string
  end

end
