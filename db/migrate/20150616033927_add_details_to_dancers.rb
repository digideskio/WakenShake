class AddDetailsToDancers < ActiveRecord::Migration
  def change
    add_column :dancers, :bio, :string
    add_column :dancers, :year, :string
    add_column :dancers, :goal, :integer
    add_column :dancers, :gender, :string
    add_column :dancers, :tshirt, :string
    add_column :dancers, :residence, :string
    add_column :dancers, :shift, :string
    add_column :dancers, :first_time, :boolean
    add_column :dancers, :hear_about, :string
    add_column :dancers, :food_allergies, :string
    add_column :dancers, :vegetarian, :boolean
    add_column :dancers, :contact_name, :string
    add_column :dancers, :contact_number, :string
    add_column :dancers, :conditional_details, :string
    add_column :dancers, :dancing_for, :string
  end
end
