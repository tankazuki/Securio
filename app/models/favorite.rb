class Favorite < ApplicationRecord

  belongs_to :camera, counter_cache: :favorites_count
  belongs_to :user

end
