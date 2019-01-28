class News < ApplicationRecord
  validates :title,  presence: true, length: { maximum: 50 }
  validates :news_type,  presence: true
  validates :content,  presence: true, length: { maximum: 400 }

  attachment :news_image

  enum news_type: {"サイト案内": 0, "カメラ案内": 1}

end
