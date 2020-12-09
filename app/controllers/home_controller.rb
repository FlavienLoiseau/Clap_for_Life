class HomeController < ApplicationController
  
  def homepage
    @missions = Mission.all.sort_by(&:start_date).reverse[0..5]
  end

  def clap_vision
  end

  def clap_team
  end

end
