class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(user_id: params[:user_id], camera_id: params[:camera_id])
    @favorite.save
    {
      aa: "aaa",
      ss: "ss"
    }
    render json: {favorite_id: @favorite.id}
  end

  def destroy
    favorite = Favorite.find_by(params[:id])
    favorite.destroy
  end

end
