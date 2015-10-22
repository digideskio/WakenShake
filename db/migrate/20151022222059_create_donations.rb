class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.float :amount
      t.string :name
      t.string :message

      t.timestamps null: false
    end
  end
end
