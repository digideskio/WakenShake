class AboutController < ApplicationController
  def index
  end

  def committee
    @chairs = Dancer.where('stafftitle LIKE ?' '%CoChair%').all
    @staff = Dancer.where.not('stafftitle LIKE ?' '%CoChair%').all
  end
end
