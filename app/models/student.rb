class Student < ApplicationRecord
  belongs_to :school
  has_many :enrollments, dependent: :destroy
  has_many :transfers, dependent: :destroy
  has_many :cohorts, through: :enrollments

  def full_name
    "#{first_name} #{last_name}"
  end

  def enrolled_courses
    cohorts.collect(&:name).join(', ')
  end
end
