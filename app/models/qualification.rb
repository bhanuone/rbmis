class Qualification < ActiveRecord::Base
  has_many :doctors

  validates :name, presence: true,
                   uniqueness: true
end
