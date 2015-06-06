class AddQualificationIdToDoctor < ActiveRecord::Migration

  def change
    add_reference :doctors, :qualification, index: true
  end

end
