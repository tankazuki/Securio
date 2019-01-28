class Camera < ApplicationRecord
  is_impressionable counter_cache: true

  belongs_to :manufacturer
  has_many :favorites, dependent: :destroy
  has_many :camera_images, dependent: :destroy
  has_many :camera_codecs, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reports, dependent: :destroy

  accepts_nested_attributes_for :camera_images, allow_destroy: true

  validates :camera_name,  presence: true, length: { maximum: 20 }
  validates :resolution, presence: true
  validates :camera_type, presence: true
  validates :audio, presence: true
  validates :size, presence: true
  validates :weight, presence: true, :numericality => { :less_than => 100 }

  enum resolution:{"3840*2160": 0, "1920*1080": 1, "1280*720": 2, "640*480": 3}
  enum camera_type:{"box": 0, "dome": 1, "onebody": 2, "vandal": 3, "fisheye": 4, "PTZ": 5}
  enum audio:{"None": 0, "BuiltIn": 1, "External": 2}

  attr_accessor :width
  attr_accessor :height
  attr_accessor :depth
end
