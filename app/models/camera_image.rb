class CameraImage < ApplicationRecord
  belongs_to :camera
  attachment :camera_image

end
