class HomeController < ApplicationController
  
  def homepage
    @missions = Mission.all.limit(6)
  end

  def clap_vision
  end

  def clap_team
  end

end
