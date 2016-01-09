class AddDormToDancer < ActiveRecord::Migration
  def change
    add_reference :dancers, :dorm, index: true, foreign_key: true
  end
end
