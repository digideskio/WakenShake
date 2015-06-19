class AddPasswordDancer < ActiveRecord::Migration
  def change
  	add_column :dancers, :password, :password
  end
end
