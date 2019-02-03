class RemoveColumFavoritesCountToCameras < ActiveRecord::Migration[5.2]
  def change
    remove_column :cameras, :favorites_count
  end
end
