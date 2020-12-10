class HomeController < ApplicationController
  
  def homepage
    @missions = Mission.all.sort_by(&:start_date).reverse[0..5]
  end

end
