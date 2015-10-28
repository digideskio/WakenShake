class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :dancer, index: true, foreign_key: true
      t.float :amount
      t.string :name
      t.string :messages

      t.timestamps null: false
    end
  end
end
