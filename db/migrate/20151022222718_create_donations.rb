class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.float :amount
      t.string :name
      t.integer :gift_id
      t.integer :gift_type

      t.timestamps null: false
    end

    add_index :donations, :gift_id
  end
end
