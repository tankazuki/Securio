class ReviewsController < ApplicationController
  before_action :authenticate_user!, only:[:create]

  def create
    camera_id = params[:camera_id]
    @review = Review.new(review_params)
    @review.save
    flash[:success] = "コメントを投稿しました"
    redirect_to camera_path(camera_id)
  end


  private
  def review_params
    params.require(:review).permit(:review_text, :rate, :review_image, :camera_id, :user_id)
  end
end
