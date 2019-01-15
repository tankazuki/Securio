class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.text :report_text
      t.references :camera, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
