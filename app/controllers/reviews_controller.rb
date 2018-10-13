class ReviewsController < ApplicationController
  before_action :set_student, :set_tutor
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?


  def new # 1 Lesson => 1 Review

    # we need @tutor in our `simple_form_for`

    skip_authorization # allowed to redirect

    lessons_collection = (@tutor.lessons.pluck(:id) & @student.lessons.pluck(:id))

    if lessons_collection != []
      reviews_collection = Review.where(tutor: @tutor, student: @student)

      if reviews_collection.present?

        if reviews_collection.size < lessons_collection.size
          @review = Review.new
          authorize @review
        else

          flash[:alert] = "Sorry #{@student.first_name}, you already wrote a review about last lesson with #{@tutor.last_name}..."
          redirect_to tutor_path(@tutor)
        end

      else
        @review = Review.new
        authorize @review
      end

    else
      redirect_to tutor_path(@tutor)
    end

  end

  def create
    @review = Review.new(review_params)
    @review.tutor = @tutor
    @review.student = @student
    authorize @review

    if @review.save
      redirect_to tutor_path(@tutor)
    else
      render :new
    end
  end

  private

  def set_student
    if current_student.present?
      @student = current_student
#     authorize @student
    end
  end

  def set_tutor
    @tutor = Tutor.find(params[:tutor_id])
#   authorize @tutor
  end

  def review_params
    params.require(:review).permit(:title, :content, :rating, :tutor_id, :student_id )
  end
end
