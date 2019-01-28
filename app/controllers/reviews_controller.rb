class ReviewsController < ApplicationController

  def create
    camera_id = params[:camera_id]
    @review = Review.new(review_params)
    if @review.save
      redirect_to camera_path(camera_id)
    else
      redirect_to camera_path(camera_id)
    end
  end


  private
  def review_params
    params.require(:review).permit(:review_text, :rate, :review_image, :camera_id, :user_id)
  end
end
