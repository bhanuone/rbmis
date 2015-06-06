class AddSpecializationIdToDoctor < ActiveRecord::Migration

  def change
    add_reference :doctors, :specialization, index: true
  end

end
