# == Schema Information
#
# Table name: histories
#
#  id                 :integer          not null, primary key
#  name               :string
#  theme              :string
#  year               :datetime
#  overview           :string
#  amount_raised      :string
#  num_of_dancers     :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'test_helper'

class HistoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
