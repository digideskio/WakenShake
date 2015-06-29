class AddTeamToDancer < ActiveRecord::Migration
  def change
    add_reference :dancers, :team, index: true, foreign_key: true
  end
end
