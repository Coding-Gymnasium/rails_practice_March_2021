class Enrollment < ApplicationRecord
  belongs_to :school
  belongs_to :student
  belongs_to :cohort

  validates :student, uniqueness: { scope: :cohort_id }
end
