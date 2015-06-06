class Speciality < ActiveRecord::Base

  has_and_belongs_to_many :hospitals
  belongs_to :treatment_category

  validates_presence_of :treatment_category_id
  
  validates :name, presence: true,
                   uniqueness: true,
                   length: {minimum: 5}
  validates :description, presence: true,
                   length: {minimum: 20}
  scope :sort_by_name, -> { Speciality.find_by_sql('SELECT * FROM SPECIALITIES ORDER BY name') }
  
end