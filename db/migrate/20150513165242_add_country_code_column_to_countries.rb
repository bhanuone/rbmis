class AddCountryCodeColumnToCountries < ActiveRecord::Migration
  
  def up
    add_column :countries, :iso_code, :string
  end

  def down
    remove_column :countries, :iso_code
  end

end
