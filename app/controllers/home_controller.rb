class HomeController < ApplicationController
  def index
  end

  def homepage
    @missions = Mission.all
  end

  def pages
  end

end
