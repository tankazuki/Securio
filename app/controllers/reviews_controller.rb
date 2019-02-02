class ReviewsController < ApplicationController
  before_action :authenticate_user!, only:[:create]

  def create
    camera_id = params[:camera_id]
    @review = Review.new(review_params)
    @review.save
    flash[:success] = "コメントを投稿しました"
    redirect_to camera_path(camera_id)
  end

  def destroy
    review = Review.find(params[:camera_id])
    if review.user_id == current_user.id
      review.destroy
      flash[:success] = "コメントを削除しました"
      redirect_to camera_path(params[:id])
    else
      flash[:danger] = "権限がありません"
      redirect_to camera_path(params[:id])
    end
  end


  private
  def review_params
    params.require(:review).permit(:review_text, :rate, :review_image, :camera_id, :user_id)
  end
end
