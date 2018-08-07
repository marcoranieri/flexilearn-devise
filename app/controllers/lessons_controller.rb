class LessonsController < ApplicationController
  # skip_before_action :authenticate_student!, only: :home
  # skip_before_action :authenticate_tutor!, only: :home
  before_action :find_lesson, only: [ :show ]
  def index
    @lessons = Lesson.all
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

  private

  def find_lesson
    @lesson = Lesson.find(params[:id])
  end

end
