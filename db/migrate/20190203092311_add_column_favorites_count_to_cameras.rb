class AddColumnFavoritesCountToCameras < ActiveRecord::Migration[5.2]
  def change
    add_column :cameras, :favorites_count, :integer, default:0
  end
end
