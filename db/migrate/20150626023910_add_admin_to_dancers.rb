class AddAdminToDancers < ActiveRecord::Migration
  def change
    add_column :dancers, :admin, :boolean, default: false
  end
end
