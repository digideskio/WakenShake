class AddCurrentToChampions < ActiveRecord::Migration
  def change
    add_column :champions, :current, :boolean
  end
end
