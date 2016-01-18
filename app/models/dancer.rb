# == Schema Information
#
# Table name: dancers
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  bio                    :string
#  year                   :string
#  goal                   :integer
#  gender                 :string
#  tshirt                 :string
#  shift                  :string
#  first_time             :boolean
#  hear_about             :string
#  food_allergies         :string
#  vegetarian             :boolean
#  contact_name           :string
#  contact_number         :string
#  conditional_details    :string
#  dancing_for            :string
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
#  admin                  :boolean          default(FALSE)
#  team_id                :integer
#  staff_member           :boolean
#  dorm_id                :integer
#

class Dancer < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :team
  has_many :charges
  has_many :donations, as: :gift
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :year, presence: true
  validates :goal, presence: true
  validates :gender, presence: true
  validates :tshirt, presence: true
  validates :dorm_id, presence: true
  validates :shift, presence: true
  validates :first_time, presence: true
  validates :vegetarian, presence: true
  validates :dancing_for, presence: true
  validates :email, presence: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "app_icon.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.search(query)
    where("first_name LIKE ? OR last_name LIKE ?", "%#{query}%", "%#{query}%")
  end
end
