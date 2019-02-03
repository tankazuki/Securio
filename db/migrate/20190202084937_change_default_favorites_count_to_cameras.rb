class ChangeDefaultFavoritesCountToCameras < ActiveRecord::Migration[5.2]
  def change
    change_column :cameras, :favorites_count, :integer, default:0
  end
end
