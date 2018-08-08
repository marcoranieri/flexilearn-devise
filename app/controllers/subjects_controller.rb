class SubjectsController < ApplicationController
  before_action :find_subject, only: [ :show ]

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    if current_tutor

      @subject = Subject.new(subject_params)
      @subject.tutor = current_tutor

      if @subject.save
        redirect_to subjects_path
      else
        render :new
      end

    else
        redirect_to subjects_path
    end
  end

  def show
  end

  private

  def find_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :description, :price)
  end

end
