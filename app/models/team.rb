# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  count      :integer
#

class Team < ActiveRecord::Base
  has_many :dancers

  validates :name, presence: true, length: { minimum: 3 }
  validates :count, presence: true
end
