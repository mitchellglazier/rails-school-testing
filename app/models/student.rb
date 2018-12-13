class Student < ApplicationRecord
  # Validations
  validates_presence_of :name, :student_number, :gpa, :school_id
  validates_uniqueness_of :student_number
  validates :student_number, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000}
  validates :gpa, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 4.0}

  # Associations
  belongs_to :school, optional: true
end
