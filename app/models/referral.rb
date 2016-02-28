# == Schema Information
#
# Table name: referrals
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dancer_id  :integer
#

class Referral < ActiveRecord::Base
  belongs_to :dancer
  validates :name, presence: true
  validates :email, presence: true
end
