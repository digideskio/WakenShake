class AddStaffToDancer < ActiveRecord::Migration
  def change
    add_column :dancers, :staff_member, :boolean
  end
end
