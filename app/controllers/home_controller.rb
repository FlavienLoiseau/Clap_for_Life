class HomeController < ApplicationController

  def homepage
    @missions = Mission.all.limit(6)
  end

  def contact
    UserMailer.contact_form(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], email_content: params[:email_content])
  end

  def clap_vision
  end

  def clap_team
  end

end
