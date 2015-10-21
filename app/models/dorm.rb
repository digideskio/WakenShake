# == Schema Information
#
# Table name: dorms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dorm < ActiveRecord::Base
end
