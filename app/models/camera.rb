class Camera < ApplicationRecord

  belongs_to :manufacturer
  has_many :favorites
  has_many :camera_images
  has_many :camera_codecs
  has_many :reviews
  has_many :reports

  validates :camera_name,  presence: true, uniqueness: true, length: { maximum: 20 }
  validates :resolution, presence: true
  validates :camera_type, presence: true
  validates :audio, presence: true
  validates :size, presence: true
  validates :weight, presence: true, :numericality => { :less_than => 100 }
  
end
