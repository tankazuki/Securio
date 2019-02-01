class AddColumnReviewCountToCameras < ActiveRecord::Migration[5.2]
  def change
    add_column :cameras, :review_count, :integer, default:0
  end
end
