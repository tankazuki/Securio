class CamerasController < ApplicationController
  before_action :search_camera_method
  before_action :manufacture_all

  def index
    @cameras = Camera.all
  end

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

  def show
    @camera = Camera.find(params[:id])
    @manufacturer_name = Manufacturer.find(@camera.manufacturer_id).manufacturer_name
    @camera_image = CameraImage.where.not(camera_image_id: nil).find_by(camera_id: @camera.id)
  end

  def destroy
    @camera = Camera.find(params[:id])
    @camera.destroy
    redirect_to admin_camera_index_path
  end

  def search_result
    @q = Camera.search(search_params)
    @cameras = @q.result(distinct: true)
  end

  def search_camera_method
    @q = Camera.ransack(params[:q])
    @cameras = Camera.all
    @result = @q.result(distinct: true)
    @result_count = @result.count
  end

  def manufacture_all
    @manufacturers = Manufacturer.all
  end

  def resolution_groups_index
    @result_cameras = Camera.where(resolution: params[:resolution])
    @result_name = Camera.resolutions.key(params[:resolution].to_i)
  end

  def camera_type_groups_index
    @result_cameras = Camera.where(camera_type: params[:camera_type])
    @result_name = Camera.camera_types.key(params[:camera_type].to_i)
  end

  def manufacturer_groups_index
    @result_cameras = Camera.where(manufacturer_id: params[:manufacturer_id])
    @result_name = Manufacturer.find(params[:manufacturer_id]).manufacturer_name
  end


  private
  def camera_params
    params.require(:camera).permit(:camera_name, :resolution, :camera_type, :audio, :weight, :manufacturer_id, :description,
       camera_images_attributes: [:camera_image, :_destroy, :id])
  end

  def search_params
    params.require(:q).permit!
  end

end
