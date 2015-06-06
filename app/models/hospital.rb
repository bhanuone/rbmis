class Hospital < ActiveRecord::Base

  has_and_belongs_to_many :specialities
  has_and_belongs_to_many :diagnostic_facilities
  has_and_belongs_to_many :medical_equipments
  has_and_belongs_to_many :other_facilities
  has_and_belongs_to_many :hospital_categories
  has_many :schedules, dependent: :destroy
  has_many :doctors, through: :schedules

  belongs_to :area
  belongs_to :city
  
  validates_presence_of :area_id
  validates :name, presence: true,
                    length: { minimum: 10, allow_blank: true },
                    uniqueness: {scope: :area_id}
  validates :address, presence: true,
                      length: { minimum: 10, allow_blank: true }
  validates :phone,  presence: true,
                     length: { minimum: 10, allow_blank: true, message:'Minimum 10 digits should be entered' },
                     format: { with: %r{(\d{5}(?:-|\s|)\d{5,})}, allow_blank: true, message: 'Please enter a valid phone number'}
  validates :bed_capacity, presence: true,
                            numericality: {allow_blank: true, only_integer: true, greater_than_or_equal_to: 0}
  validates :appointment_charge, numericality: true,   allow_blank: true
end
