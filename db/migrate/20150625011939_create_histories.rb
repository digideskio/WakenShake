class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :name
      t.string :theme
      t.datetime :year
      t.string :overview
      t.string :amount_raised
      t.string :num_of_dancers

      t.timestamps null: false
    end
  end
end
