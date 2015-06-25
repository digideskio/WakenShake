# == Schema Information
#
# Table name: dancers
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  amount_raised          :float
#  bio                    :string
#  year                   :integer
#  gender                 :string
#  tshirt                 :string
#  residence              :string
#  shift                  :string
#  first_time             :boolean
#  hear_about             :string
#  food_allergies         :string
#  vegetarian             :boolean
#  contact_name           :string
#  contact_number         :string
#  conditional_details    :string
#  dancing_for            :string
#  password               :password
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#

require 'test_helper'

class DancerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
