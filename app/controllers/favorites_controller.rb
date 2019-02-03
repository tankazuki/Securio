class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(user_id: params[:user_id], camera_id: params[:camera_id])
    @favorite.save
    render json: {favorite_id: @favorite.id}
  end

  def destroy
    favorite = Favorite.find_by(params[:id])
    favorite.destroy
  end

  def favorites_index
    @favorites = Favorite.where(user_id: current_user.id).order(created_at: 'DESC')
  end

end
