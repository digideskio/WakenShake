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
#  stafftitle             :string
#

class Dancer < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  belongs_to :team
  has_many :charges, as: :charged
  validates :email, presence: {message: "Your email cannot be blank"}, uniqueness: {message: "This email address is already being used"}
  validates :password, presence: {message: "Your password cannot be blank"}, length: {minimum: 8, too_short: "Your password must have at least 8 characters"}
  validates :first_name, presence: {message: "Your first name cannot be blank"}
  validates :last_name, presence: {message: "Your last name cannot be blank"}
  validates :year, presence: {message: "Indicate your year"}
  validates :goal, presence: {message: "Set your fundraising goal"}
  validates :gender, presence: {message: "Indicate your gender"}
  validates :tshirt, presence: {message: "Select your t-shirt size"}
  validates :dorm_id, presence: {message: "Indicate which dorm you live in"}
  validates :shift, presence: {message: "Select the shift you prefer to dance in"}
  validates :first_time, presence: {message: "Indicate whether this is your first Wake 'N Shake or not"}
  validates :vegetarian, presence: {message: "Indicate whether you are a vegetarian or not"}
  validates :dancing_for, presence: {message: "Indicate who you are dancing for"}
  has_attached_file :avatar, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "app_icon.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validate :password_complexity

  def password_complexity
    if password.present? and not password.match(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[_\W])/)
      errors.add :password, "Your password must include at least one lowercase letter, one uppercase letter, one digit, and one symbol."
    end
  end

  def self.search(query)
    where("first_name LIKE ? OR last_name LIKE ?", "%#{query}%", "%#{query}%")
  end
end
