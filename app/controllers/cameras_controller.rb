class CamerasController < ApplicationController

  def new
    @camera = Camera.new
    @camera.camera_images.build
  end

  def create
    @camera = Camera.new(camera_params)
    @camera.size = params[:camera][:width] + '*' + params[:camera][:height] + '*' + params[:camera][:depth]
    if @camera.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @camera = Camera.find(params[:id])
    @camera.destroy
    redirect_to admin_camera_index_path
  end

  private
  def camera_params
    params.require(:camera).permit(:camera_name, :resolution, :camera_type, :audio, :weight, :manufacturer_id, :description,
       camera_images_attributes: [:camera_image, :_destroy, :id])
  end

end
