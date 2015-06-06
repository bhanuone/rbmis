class AddNameToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :name, :string, index: true
  end
end
