class AddYearToChampions < ActiveRecord::Migration
  def change
    add_column :champions, :year, :int
  end
end
