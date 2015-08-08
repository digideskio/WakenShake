class AddAccountantToDancer < ActiveRecord::Migration
  def change
    add_column :dancers, :is_accountant, :boolean
  end
end
