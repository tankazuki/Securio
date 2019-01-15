class CreateCameras < ActiveRecord::Migration[5.2]
  def change
    create_table :cameras do |t|
      t.string :camera_name
      t.integer :resolution
      t.integer :camera_type
      t.integer :audio
      t.string :size
      t.integer :weight
      t.references :manufacturer, foreign_key: true

      t.timestamps
    end
  end
end
