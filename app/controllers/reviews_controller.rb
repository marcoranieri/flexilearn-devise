class ReviewsController < ApplicationController
  before_action :set_tutor

  def new
    # we need @tutor in our `simple_form_for`
    @review = Review.new

    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.tutor = @tutor
    authorize @review

    if @review.save
      redirect_to tutor_path(@tutor)
    else
      render :new
    end
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:tutor_id])
    authorize @tutor
  end

  def review_params
    params.require(:review).permit(:title, :content, :rating, :tutor_id, :reviewer_id )
  end
end
