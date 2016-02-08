class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
