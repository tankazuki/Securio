class AddColumnsImpressionCountToCamera < ActiveRecord::Migration[5.2]
  def change
    add_column :cameras, :impressions_count, :integer, default: 0
  end
end
