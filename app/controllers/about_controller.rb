class AboutController < ApplicationController
  def index
  end

  def committee
    @chairs = Dancer.where('stafftitle LIKE ?', '%Cochair%').all
    @staff = Dancer.where.not('stafftitle LIKE ?', '%Cochair%').all
  end
end
