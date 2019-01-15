class Favorite < ApplicationRecord

  belongs_to :camera
  belongs_to :user

  add_foreign_key :favorites, :users
  add_foreign_key :favorites, :cameras
  
end
