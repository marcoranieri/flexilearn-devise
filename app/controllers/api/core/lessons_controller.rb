class Api::Core::LessonsController < Api::Core::BaseController
  def index
    @lessons = Student.find(params[:student]).lessons
  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end
