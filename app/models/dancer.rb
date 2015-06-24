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
#  password            :password
#

class Dancer < ActiveRecord::Base
  belongs_to :team
  has_many :charge

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email_address, presence: true, confirmation: true
  validates :password, length: { in: 6..20 }
  validates :bio, length: { maximum: 500, too_long: "%{ count } characters is the maximum allowed." }
  validates :year, presence: true
  validates :gender, presence: true
  validates :tshirt, presence: true
  validates :contact_name, presence: true, length: { minimum: 2 }
  validates :contact_number, presence: true, length: { minimum: 5 }

  def self.search(query)
    where("first_name like ?", "%#{query}%")
  end
end
