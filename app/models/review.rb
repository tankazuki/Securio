class Review < ApplicationRecord

  belongs_to :camera
  belongs_to :user

  validates :review_text,  presence: true, length: { maximum: 200 }

  add_foreign_key :reviews, :users
  add_foreign_key :reviews, :cameras

end
