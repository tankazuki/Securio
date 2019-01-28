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

  enum resolution:{"4K": 0, "FullHD": 1, "HD": 2, "VGA": 3}
  enum camera_type:{"ボックス型": 0, "ドーム型": 1, "バレット型": 2, "非破壊型": 3, "魚眼カメラ": 4, "PTZカメラ": 5}
  enum audio:{"無し": 0, "内蔵マイク": 1, "外部マイク": 2}

  attr_accessor :width
  attr_accessor :height
  attr_accessor :depth
end
