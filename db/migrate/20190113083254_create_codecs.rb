class CreateCodecs < ActiveRecord::Migration[5.2]
  def change
    create_table :codecs do |t|
      t.string :codec

      t.timestamps
    end
  end
end
