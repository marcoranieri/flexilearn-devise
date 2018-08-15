class TutorsController < ApplicationController
  # skip_before_action :authenticate_tutor!, only: :home
  before_action :find_tutor, only: [ :show ]

  def index
    @tutors = Tutor.all
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

  def find_tutor
    @tutor = Tutor.find(params[:id])
  end
end
