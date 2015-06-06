class TreatmentCategory < ActiveRecord::Base
  has_many :treatments, class_name: "Speciality"

  validates :name, presence: true,
                   uniqueness: true
end
