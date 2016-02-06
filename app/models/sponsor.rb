# == Schema Information
#
# Table name: sponsors
#
#  id                :integer          not null, primary key
#  name              :string
#  link              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  logo_file_name    :string
#  logo_content_type :string
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

class Sponsor < ActiveRecord::Base

  has_attached_file :logo, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "app_icon.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

end
