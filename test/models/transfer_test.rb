require 'test_helper'

class TransferTest < ActiveSupport::TestCase
  setup do
    @school = School.create(name: "Test school", location: "Test address", description: "Test description")
    @school_1 = School.create(name: "Test school_1", location: "Test address 1", description: "Test description 1")
    @curriculum = Curriculum.create(title: "Curriculum test", description: "Curriculum description", capacity: 5)
    @curriculum_1 = Curriculum.create(title: "Curriculum test 1", description: "Curriculum description 1", capacity: 5)
    @school.teachers << @teacher = teachers(:one)
    @school.cohorts << @cohort = Cohort.create(name: "Cohort test", school_id: @school.id, teacher_id: @teacher.id, curriculum_id: @curriculum.id)
    @school_1.teachers << @teacher_1 = teachers(:one)
    @school_1.cohorts << @cohort_1 = Cohort.create(name: "Cohort test", school_id: @school_1.id, teacher_id: @teacher_1.id, curriculum_id: @curriculum_1.id)
    @school.students << @student = students(:one)
    @transfer = Transfer.create({student: @student, destination: @school_1, cohort: @cohort_1, start: "#{Date.today}", end: "#{Date.today + 90}" })
  end

  test "" do
  end
end
#pry(#<EnrollmentsController>)> params#=> <ActionController::Parameters {"utf8"=>"✓", "authenticity_token"=>"tpRVKWZT78jDn0hqM6g29BAlbjra4Mc2I18fdeHGyKMo/FQ/ne5b5l2bo2J6/MHKf5xWuihaSUyJNHOtoSQjsA==", "enrollment"=>{"school_id"=>"1", "student_id"=>"5", "cohort_id"=>"1", "start_date(1i)"=>"2021", "start_date(2i)"=>"3", "start_date(3i)"=>"7", "end_date(1i)"=>"2021", "end_date(2i)"=>"3", "end_date(3i)"=>"7"}, "commit"=>"Create Enrollment", "controller"=>"enrollments", "action"=>"create", "school_id"=>"1"} permitted: false>
