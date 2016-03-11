# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  place      :string
#  date_time  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base

  validates :title, presence: true
  validates :text, presence: true, length: {maximum: 150, too_long: " must be under 150 characters long"}
  validates :place, presence: true
  validates :date_time, presence: true
end
