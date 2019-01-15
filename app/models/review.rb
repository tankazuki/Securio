class Review < ApplicationRecord

  belongs_to :camera
  belongs_to :user

  validates :review_text,  presence: true, length: { maximum: 200 }

end
