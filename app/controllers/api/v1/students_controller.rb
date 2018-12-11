# app/controllers/api/v1/students_controller.rb

class Api::V1::StudentsController < Api::V1::BaseController

  def index
    # @lessons = policy_scope(Lesson)
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

end
