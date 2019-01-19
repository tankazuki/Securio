class RenameCameraImageColumnToCameraImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :camera_images, :camera_image, :camera_image_id
  end
end
