class AddAmountRaisedToDancers < ActiveRecord::Migration
  def change
    add_column :dancers, :amount_raised, :double
  end
end
