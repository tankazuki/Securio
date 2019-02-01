class Review < ApplicationRecord

  belongs_to :camera, counter_cache: :review_count
  belongs_to :user

  attachment :review_image

  validates :review_text,  presence: true, length: { maximum: 200 }

end
