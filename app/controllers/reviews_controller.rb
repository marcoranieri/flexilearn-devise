class ReviewsController < ApplicationController
  def new
    # we need @tutor in our `simple_form_for`
    @tutor = Tutor.find(params[:tutor_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `tutor_id` to asssociate review with corresponding restaurant
    @review.tutor = Tutor.find(params[:tutor_id])
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating, :tutor_id )
  end
end
