class RenameReviewImageToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :review_image, :review_image_id
  end
end
