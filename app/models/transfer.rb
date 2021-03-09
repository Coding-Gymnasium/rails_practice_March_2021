class Transfer < ApplicationRecord
  belongs_to :student
  belongs_to :school
  belongs_to :cohort

  validates :student_id, :school_id, :cohort_id, presence: true
  validates :student, uniqueness: { scope: :cohort_id }

end
