class ChanreBooleanColumnFalseToTrue < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :enable, :boolean, default: true
  end
end
