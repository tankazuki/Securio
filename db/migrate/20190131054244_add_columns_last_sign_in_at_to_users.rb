class AddColumnsLastSignInAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_sign_in_time, :datetime, default: "1970:1:1:00:00:00"
  end
end
