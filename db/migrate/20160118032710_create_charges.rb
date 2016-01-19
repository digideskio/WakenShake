class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.float :amount
      t.references :charged, polymorphic: true, index: true
      t.boolean :is_registration_fee
      t.boolean :is_donation

      t.timestamps null: false
    end
  end
end
