# app/controllers/api/v1/lessons_controller.rb

class Api::V1::LessonsController < Api::V1::BaseController

  def index
    # @lessons = policy_scope(Lesson)
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

end
