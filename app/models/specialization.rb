class Specialization < ActiveRecord::Base
  has_many :doctors
  
  validates :name, presence: true,
                   uniqueness: true

  scope :sort_by_name, -> { Specialization.find_by_sql('SELECT * FROM specializations ORDER BY name') }
end
