class AddAmountRaisedToDancers < ActiveRecord::Migration
  def change
    add_column :dancers, :amount_raised, :float
  end
end
