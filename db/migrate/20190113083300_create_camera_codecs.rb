class CreateCameraCodecs < ActiveRecord::Migration[5.2]
  def change
    create_table :camera_codecs do |t|
      t.references :camera, foreign_key: true
      t.references :codec, foreign_key: true

      t.timestamps
    end
  end
end
