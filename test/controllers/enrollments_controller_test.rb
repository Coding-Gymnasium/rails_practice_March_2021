require 'test_helper'

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = School.create!(name: "School test", description: "A school for the test", location: "Denver, Colorado")
    @enrollment = enrollments(:one)
    @school.enrollments << @enrollment
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
      post school_enrollments_path(@school.id), params: { enrollment: { cohort_id: @enrollment.cohort_id, end_date: @enrollment.end_date, school_id: @enrollment.school_id, start_date: @enrollment.start_date, student_id: @enrollment.student_id } }
    end

    assert_redirected_to enrollment_path(Enrollment.last)
  end

  test "should show enrollment" do
    get school_enrollment_path(@school, @enrollment)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_enrollment_path(@school, @enrollment)
    assert_response :success
  end

  test "should update enrollment" do
    patch school_enrollment_url(@school, @enrollment), params: { enrollment: { cohort_id: @enrollment.cohort_id, end_date: @enrollment.end_date, school_id: @enrollment.school_id, start_date: @enrollment.start_date, student_id: @enrollment.student_id } }
    assert_redirected_to school_enrollment_path(id: @enrollment.id)
  end

  test "should destroy enrollment" do
    assert_difference('Enrollment.count', -1) do
      delete "/schools/#{@school.id}/enrollments/#{@enrollment.id}"
     # delete enrollment_path(@enrollment)
    end

    assert_redirected_to school_enrollments_path
  end
end
