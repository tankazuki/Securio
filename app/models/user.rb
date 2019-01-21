class User < ApplicationRecord

  has_many :favorites, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_secure_password

  attachment :user_image

  validates :nickname,  presence: true, length: { maximum: 20 }
  validates :mail, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :password_digest, presence: true, length: { minimum: 20 }

end
