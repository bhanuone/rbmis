class Country < ActiveRecord::Base

  has_many :states, dependent: :destroy

  before_validation :normalize_name_and_iso_code
  
  validates :name, presence: true,
                   length: {minimum:4, allow_blank: true},
                   uniqueness: true
  validates :iso_code, presence: true,
                   length: {is: 2, allow_blank: true},
                   uniqueness: true
  def self.as_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end

  def normalize_name_and_iso_code
    self.name = self.name.downcase.capitalize if self.name.present?
    self.iso_code = self.iso_code.upcase if self.iso_code.present?
  end
end