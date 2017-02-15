class RemoveYearFromChampions < ActiveRecord::Migration
  def change
    remove_column :champions, :year, :int
  end
end
