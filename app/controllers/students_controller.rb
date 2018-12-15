class StudentsController < ApplicationController

  # skip_before_action :authenticate_student!, only: :home
  before_action :find_student, only: [ :show, :edit, :update ]

  def index
    @students = policy_scope(Student)
  end

  def show
    # Avatar placeholder
    @a = "https://kooledge.com/assets/default_medium_avatar-57d58da4fc778fbd688dcbc4cbc47e14ac79839a9801187e42a796cbd6569847.png"
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
    authorize @student
  end
end
