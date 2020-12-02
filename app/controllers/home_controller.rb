class HomeController < ApplicationController
  def index
  end

  def homepage
    @missions = Mission.all
  end

  def pages
  end

  def contact
  end

  def vision
  end

  def operations
  end
end
