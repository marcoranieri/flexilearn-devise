class TutorsController < ApplicationController

  # skip_before_action :authenticate_tutor!, only: :home
  before_action :find_tutor, only: [ :new, :show, :edit, :update ]
  before_action :find_student, only: [ :new, :show, :edit, :update ]

  def index
    @tutors = policy_scope(Tutor)

    # Avatar placeholder
    @a = "https://kooledge.com/assets/default_medium_avatar-57d58da4fc778fbd688dcbc4cbc47e14ac79839a9801187e42a796cbd6569847.png"
  end

  def show
    if Review.where(tutor: params[:id]).present?
      @average = (Review.where(tutor: params[:id]).pluck(:rating).reduce(:+) / Review.where(tutor: params[:id]).count.to_f).round(2)
    end

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

  def find_tutor
    @tutor = Tutor.find(params[:id])
    authorize @tutor
  end

  def find_student
    if current_user.is_a? Student
      @student = current_student
    end
  end

end
