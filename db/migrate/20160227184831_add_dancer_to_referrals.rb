class AddDancerToReferrals < ActiveRecord::Migration
  def change
    add_reference :referrals, :dancer, index: true, foreign_key: true
  end
end
