class AddNameToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :name, :string
    add_column :teams, :count, :int
  end
end
