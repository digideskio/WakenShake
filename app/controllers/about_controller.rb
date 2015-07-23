class AboutController < ApplicationController
  def index
    @staff = Dancer.where(staff_member: true).all
  end
end
