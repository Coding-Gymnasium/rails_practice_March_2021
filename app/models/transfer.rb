class Transfer < ApplicationRecord
  belongs_to :student
  belongs_to :school
  validates :student, uniqueness: { scope: :cohort_id }
  
  def initialize(data)
    @student = data[:student]
    @origin = data[:student].school
    @destination = data[:destination]
    @cohort = data[:cohort]
    @start = data[:start]
    @end = data[:end]
    require 'pry'; binding.pry
    @enrollment = Enrollment.create(school_id: @destination.id, student_id: @student.id, cohort_id: @cohort.id, start_date: @start, end_date: @end)
  end
end
