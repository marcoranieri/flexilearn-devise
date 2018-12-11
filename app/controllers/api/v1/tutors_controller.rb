# app/controllers/api/v1/tutors_controller.rb

class Api::V1::TutorsController < Api::V1::BaseController

  def index
    # @lessons = policy_scope(Lesson)
    @tutors = Tutor.all
  end

  def show
    @tutor = Tutor.find(params[:id])
  end

end
