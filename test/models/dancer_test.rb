# == Schema Information
#
# Table name: dancers
#
#  id                  :integer          not null, primary key
#  first_name          :string
#  last_name           :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  amount_raised       :float
#  bio                 :string
#  year                :integer
#  gender              :string
#  tshirt              :string
#  residence           :string
#  shift               :string
#  first_time          :boolean
#  hear_about          :string
#  food_allergies      :string
#  vegetarian          :boolean
#  contact_name        :string
#  contact_number      :string
#  conditional_details :string
#  dancing_for         :string
#  email_address       :email
#

require 'test_helper'

class DancerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
