class Schedule < ActiveRecord::Base
  belongs_to :hospital
  belongs_to :doctor

  validates_uniqueness_of :doctor_id, :scope => :hospital_id
  validates_presence_of :hospital_id
  validates_presence_of :doctor_id
end
