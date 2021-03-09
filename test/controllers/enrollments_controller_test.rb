require 'test_helper'

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest
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
    @enrollment = Enrollment.create!(cohort_id: @cohort_1.id,student_id: @student_1.id, school_id: @school_1.id, start_date: Date.today, end_date: Date.today + 90)
    #@school_1.enrollments << @enrollment

  end

  test "should get index" do
    #get "/schools/#{@school.id}/enrollments"
    #get enrollments_url
    get school_enrollments_path(@school.id)
    assert_response :success
  end

  test "should get new" do
    get new_school_enrollment_path(@school.id)
    #get  "/schools/#{@school.id}/enrollments/new"
    assert_response :success
  end

  test "should create enrollment" do
    assert_difference('Enrollment.count') do
      #require 'pry'; binding.pry
      post school_enrollments_path(@school.id), params: { enrollment: { cohort_id: @cohort.id,student_id: @student.id, school_id: @school.id, start_date: Date.today, end_date: Date.today + 90 }}
    end

    assert_redirected_to school_enrollment_path(@school, Enrollment.last)
  end

  test "should show enrollment" do
    get school_enrollment_path(@school_1, @enrollment)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_enrollment_path(@school_1, @enrollment)
    assert_response :success
  end

  test "should update enrollment" do
    patch school_enrollment_url(@school_1, @enrollment), params: { enrollment: { cohort_id: @enrollment.cohort_id, end_date: @enrollment.end_date, school_id: @enrollment.school_id, start_date: @enrollment.start_date, student_id: @enrollment.student_id } }
    assert_redirected_to school_enrollment_path(@enrollment)
  end

  test "should destroy enrollment" do
    assert_difference('Enrollment.count', -1) do
      delete "/schools/#{@school.id}/enrollments/#{@enrollment.id}"
     # delete enrollment_path(@enrollment)
    end

    assert_redirected_to school_enrollments_path
  end
end
