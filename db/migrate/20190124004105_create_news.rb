class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.integer :news_type
      t.string :news_image_id

      t.timestamps
    end
  end
end
