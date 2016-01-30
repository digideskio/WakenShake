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
end
