require 'test_helper'

class TransfersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = School.create(name: "Test school", location: "Test address", description: "Test description")
    @curriculum = Curriculum.create(title: "Curriculum test", description: "Curriculum description", capacity: 5)
    @school.teachers << @teacher = teachers(:one)
    @school.cohorts << @cohort = Cohort.create(name: "Cohort test", school_id: @school.id, teacher_id: @teacher.id, curriculum_id: @curriculum.id)
    @school.students << @student = students(:one)
    #--------
    @school_1 = School.create(name: "Test school_1", location: "Test address 1", description: "Test description 1")
    @curriculum_1 = Curriculum.create(title: "Curriculum test 1", description: "Curriculum description 1", capacity: 5)
    @school_1.teachers << @teacher_1 = teachers(:one)
    @school_1.cohorts << @cohort_1 = Cohort.create(name: "Cohort test", school_id: @school_1.id, teacher_id: @teacher_1.id, curriculum_id: @curriculum_1.id)
    @school_1.students << @student_1 = students(:one)
    @transfer = Transfer.create!(cohort_id: @cohort_1.id,student_id: @student_1.id, school_id: @school_1.id, start_date: Date.today, end_date: Date.today + 90)
  end

  test "should get new" do
    get new_transfer_path(@transfer.id)
    assert_response :success
  end

  test "Should create transfer" do
    assert_difference('Transfer.count') do
      #require 'pry'; binding.pry
      post transfers_path, params: { transfer: { cohort_id: @cohort.id,student_id: @student.id, school_id: @school.id, start_date: Date.today, end_date: Date.today + 90}}
    end

    assert_redirected_to school_enrollment_path(@school, Enrollment.last)
  end

  test "should show transfer" do
    get transfer_path(@transfer)
    assert_response :success
  end
end
