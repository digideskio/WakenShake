class AddFoodToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :food, :boolean
  end
end
