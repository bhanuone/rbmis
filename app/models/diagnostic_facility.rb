class DiagnosticFacility < ActiveRecord::Base
  has_and_belongs_to_many :hospitals
  validates :name, presence: true,
                   uniqueness: true
end
