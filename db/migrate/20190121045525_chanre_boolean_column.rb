class ChanreBooleanColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :enable, :boolean, default: false
  end
end
