class Doctor < ActiveRecord::Base
  has_and_belongs_to_many :doctor_categories
  has_many :schedules, dependent: :destroy
  has_many :hospitals, through: :schedules
  belongs_to :specialization
  belongs_to :qualification

  # mount_uploader :avatar, DoctorAvatarUploader

  validates :full_name, presence: true,
                        length: { minimum: 3, allow_blank: true, message: 'Name should be 5 characters length' },
                        format: {with: %r{\D+}, allow_blank: true, message: 'Please enter a valid name'}
  validates :practice_name, presence: true,
                        length: { minimum: 6, allow_blank: true }
  validates :email, presence: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, allow_blank: true },
                    uniqueness: true
  validates :experience, presence: true, numericality: {only_integer: true, allow_blank: true}

  accepts_nested_attributes_for :schedules, allow_destroy: true

end
