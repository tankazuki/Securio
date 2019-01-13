class CreateCameraImages < ActiveRecord::Migration[5.2]
  def change
    create_table :camera_images do |t|
      t.text :camera_image
      t.references :camera, foreign_key: true

      t.timestamps
    end
  end
end
