# == Schema Information
#
# Table name: donations
#
#  id         :integer          not null, primary key
#  dancer_id  :integer
#  amount     :float
#  name       :string
#  messages   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Donation < ActiveRecord::Base
  belongs_to :dancer
end
