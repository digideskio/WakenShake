class AboutController < ApplicationController
  def index
  end
  def committee
    @chairs = Dancer.where(staff_member: true, stafftitle: "Co-Chair").all
    @staff = Dancer.where(staff_member: true).all
  end
end
