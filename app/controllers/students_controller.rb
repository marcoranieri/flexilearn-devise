class StudentsController < ApplicationController
  # skip_before_action :authenticate_student!, only: :home
  before_action :find_student, only: [ :show ]

  def index
    @students = Student.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end
end
