class State < ActiveRecord::Base
  belongs_to :country
  has_many :cities, dependent: :destroy
  has_many :hospitals, through: :cities
  
  validates :name, presence: true,
                   length: {minimum:3},
                   uniqueness: true
  validates :country_id, presence: true,
                         numericality: {only_integer: true}
end
