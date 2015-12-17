# == Schema Information
#
# Table name: teams
#
#  id            :integer          not null, primary key
#  name          :string
#  amount_raised :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Team < ActiveRecord::Base
  has_many :dancers
  has_many :donations

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end
end
