# == Schema Information
#
# Table name: champions
#
#  id                 :integer          not null, primary key
#  name               :string
#  bio                :text
#  team               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Champion < ActiveRecord::Base

  validates :name, presence: true
  validates :bio, presence: true
  validates :team, presence: true
  validates :photo, presence: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
