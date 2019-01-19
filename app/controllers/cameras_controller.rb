class CamerasController < ApplicationController

  def new
    @camera = Camera.new
  end

  def create
    @camera = Camera.new(camera_params)
    @camera.size = params[:camera][:width] + '*' + params[:camera][:height] + '*' + params[:camera][:depth]
    if @camera.save
      redirect_to root_path
    else
          logger.debug @camera.errors.inspect
      render 'new'
    end
  end

  private
  def camera_params
    params.require(:camera).permit(:camera_name, :resolution, :camera_type, :audio, :weight, :manufacturer_id, :description)
  end

end
