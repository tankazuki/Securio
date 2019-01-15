class CameraCodec < ApplicationRecord

  belongs_to :camera
  belongs_to :codec

  add_foreign_key :camera_codecs, :users
  add_foreign_key :camera_codecs, :cameras
end
