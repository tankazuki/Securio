class Codec < ApplicationRecord

  has_many :camera_codecs, dependent: :destroy
  validates :codec, presence: true, uniqueness: true

end
