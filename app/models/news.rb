class News < ApplicationRecord
  validates :title,  presence: true, length: { maximum: 50 }
  validates :news_type,  presence: true
  validates :content,  presence: true, length: { maximum: 400 }

  attachment :news_image

  enum news_type: {"site_news": 0, "camera_news": 1}

end
