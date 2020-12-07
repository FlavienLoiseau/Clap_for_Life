class HomeController < ApplicationController
  def index
  end

  def homepage
    @missions = Mission.all.limit(6)
  end

  def pages
  end

  def contact
    UserMailer.contact_form(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], email_content: params[:email_content])
  end

  def vision
  end

  def operations
  end



  def dashboard
    @user = current_user
  end

end
