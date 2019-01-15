class Codec < ApplicationRecord

  has_many: camera_codecs
  validates :codec, presence: true, uniqueness: true

end
