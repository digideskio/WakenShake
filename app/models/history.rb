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

class History < ActiveRecord::Base
  validates :theme, presence: true
  validates :year, presence: true
  validates :num_of_dancers, presence: true
  validates :amount_raised, presence: true
  
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
