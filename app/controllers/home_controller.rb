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

  def missions
    @user = current_user
    @missions = Mission.all
    @participations = Participation.all
  end

  def organisationinfo
    @user = current_user
  end

  def organisationedit
    @user = current_user
  end

  def dashboard
    @user = current_user
  end

end
