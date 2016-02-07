class AddDisclaimerToDancer < ActiveRecord::Migration
  def change
    add_column :dancers, :disclaimer, :boolean
  end
end
