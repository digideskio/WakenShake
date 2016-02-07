class AboutController < ApplicationController
  def index
  end

  def committee
    @chairs = Dancer.where(stafftitle: "Co-Chair").all
    @staff = Dancer.where.not(stafftitle: nil, stafftitle: "Co-Chair").all
  end
end
