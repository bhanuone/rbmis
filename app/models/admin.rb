class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true,
                   uniqueness: true
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
end
