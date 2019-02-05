class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(user_id: params[:user_id], camera_id: params[:camera_id])
    @favorite.save
    favorite_count = Camera.find(params[:camera_id]).favorites_count
    render json: {favorite_id: @favorite.id, favorite_count: favorite_count}
  end

  def destroy
    favorite = Favorite.find_by(params[:id])
    favorite.destroy
    favorite_count = Camera.find(params[:camera_id]).favorites_count
    render json: {favorite_count: favorite_count}
  end

  def favorites_index
    @favorites = Favorite.where(user_id: current_user.id).order(created_at: 'DESC')
  end

end
