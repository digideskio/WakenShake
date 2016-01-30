class CreateChampions < ActiveRecord::Migration
  def change
    create_table :champions do |t|
      t.string :name
      t.text :bio
      t.string :team

      t.timestamps null: false
    end
  end
end
