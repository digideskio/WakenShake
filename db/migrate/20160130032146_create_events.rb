class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :text
      t.string :place
      t.timestamp :date_time

      t.timestamps null: false
    end
  end
end
