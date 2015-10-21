class AboutController < ApplicationController
  def index
  end
  def committee
    @staff = Dancer.where(staff_member: true).all
  end
end
