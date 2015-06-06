class CreateDiagnosticFacilities < ActiveRecord::Migration
  def change
    create_table :diagnostic_facilities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
