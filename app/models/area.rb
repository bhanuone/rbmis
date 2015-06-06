class Area < ActiveRecord::Base
  belongs_to :city
  has_many :hospitals, dependent: :destroy
  
  validates :name, presence: true,
                   length: {minimum:5},
                   uniqueness: {scope: :city_id}
end
