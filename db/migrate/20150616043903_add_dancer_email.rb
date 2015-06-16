class AddDancerEmail < ActiveRecord::Migration
  def change
  	add_column :dancers, :email_address, :email
  end
end
