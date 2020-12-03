class HomeController < ApplicationController
  def index
  end

  def homepage
    
      @missions = Mission.all.limit(12)
    
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
