class CreateChargetokens < ActiveRecord::Migration
  def change
    create_table :chargetokens do |t|
      t.string :email
      t.string :time

      t.timestamps null: false
    end
  end
end
