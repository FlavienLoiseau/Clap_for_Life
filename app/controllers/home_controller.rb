class HomeController < ApplicationController
  def index
  end

  def homepage
    @missions = Mission.all.limit(6)
  end

  def pages
  end

  def contact
  end

  def vision
  end

  def operations
  end



  def dashboard
    @user = current_user
  end

end
