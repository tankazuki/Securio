class User < ApplicationRecord

  has_many: favorites
  has_many: reports
  has_many: reviews

  validates :nickname,  presence: true, length: { maximum: 20 }
  validates :mail, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :password_digest, presence: true, length: { minimum: 20 }

end
