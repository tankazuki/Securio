class ChangeCameraImageToCameraImages < ActiveRecord::Migration[5.2]
  def change
    change_column :camera_images, :camera_image_id, :string
  end
end
