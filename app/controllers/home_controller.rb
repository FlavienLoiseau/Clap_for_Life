class HomeController < ApplicationController
  def index
  end

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

  def clap_business
  end

  def clap_jobs
  end

  def clap_partnerships
  end

  def press
  end

  def blog
  end

  def dashboard
    @user = current_user
  end

end
