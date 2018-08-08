class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to subject_path(@subject)
    else
      render :new
    end
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:tutor_id])
  end

  def subject_params
    params.require(:subject).permit(:name, :description, :price)
  end

end
