class AddTitleToDancer < ActiveRecord::Migration
  def change
    add_column :dancers, :stafftitle, :string
  end
end
