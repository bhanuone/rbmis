class AddAliasToSpecializations < ActiveRecord::Migration
  def change
    add_column :specializations, :alias, :string
  end
end
