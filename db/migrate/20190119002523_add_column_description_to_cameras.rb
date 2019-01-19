class AddColumnDescriptionToCameras < ActiveRecord::Migration[5.2]
  def change
    add_column :cameras, :description, :text
  end
end
