class TransfersController < ApplicationController
  before_action :set_schools
  before_action :set_students
  before_action :set_cohorts
  before_action :set_transfer, only: %i[ show ]
  
  def index
    @transfers = Transfer.all
  end

  def show
  end

  def new;
    @transfer = Transfer.new
  end

  def create
    @transfer = Transfer.new(transfer_params)
    @enrollment = Enrollment.new(school_id: @transfer.school_id, student_id: @transfer.student_id, cohort_id: @transfer.cohort_id, start_date: @transfer.start_date, end_date: @transfer.end_date) 
    respond_to do |format|
      if @transfer.save && @enrollment.save
        format.html { redirect_to "/schools/#{@enrollment.school_id}/enrollments/#{@enrollment.id}", notice: "Enrollment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  private 

  def transfer_params
    params.require(:transfer).permit(:student_id, :school_id, :cohort_id, :start_date, :end_date)
  end
  
  def set_transfer
    @transfer = Transfer.find(params[:id])
  end

  def set_schools
    @schools = School.all
  end

  def set_students
    @students = Student.all
  end

  def set_cohorts
    @cohorts = Cohort.all
  end
end
