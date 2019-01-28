class ChangeColumnsWeightToCamera < ActiveRecord::Migration[5.2]
  def change
    change_column :cameras, :weight, :float
  end
end
