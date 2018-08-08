class ReviewsController < ApplicationController
  before_action :set_tutor

  def new
    # we need @tutor in our `simple_form_for`
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `tutor_id` to associate review with corresponding restaurant
    @review.tutor = @tutor
    if @review.save
      redirect_to tutor_path(@tutor)
    else
      render :new
    end
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:tutor_id])
  end

  def review_params
    params.require(:review).permit(:title, :content, :rating, :tutor_id )
  end
end
