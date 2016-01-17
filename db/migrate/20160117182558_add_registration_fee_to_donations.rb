class AddRegistrationFeeToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :registration_fee, :boolean
  end
end
