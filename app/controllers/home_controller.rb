class HomeController < ApplicationController

  def homepage
    @missions = Mission.all.limit(6)
  end

  def contact_new
  end

  def contact_send
    UserMailer.contact_form(params[:id])
  end

  def clap_vision
  end

  def clap_team
  end

end
