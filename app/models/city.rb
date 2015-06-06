class City < ActiveRecord::Base
  belongs_to :state
  has_many :areas, dependent: :destroy
  has_many :hospitals, through: :areas
  has_many :doctors, through: :hospitals
  
  validates :name, presence: true,
                   length: {minimum:5},
                   uniqueness: {scope: :state_id}
end
