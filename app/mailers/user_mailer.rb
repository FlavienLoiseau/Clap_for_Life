class UserMailer < ApplicationMailer
  def contact_form(first_name, last_name, user_email, email_content)
    @first_name = first_name
    @last_name = last_name
    @email_content = email_content

    admins_emails = User.admin.pluck(:email)
    mail(from: user_email to: admins_emails, subject: "Contact from #{@first_name} #{@last_name}")
  end

  def mission_subscribe(participation)
    @user = participation.user
    @organisation = participation.mission.organisation
    @mission = participation.mission

    mail(to: @user.email, subject: "#{@organisation.name} - #{@mission.title}")
  end

  def mission_unsubscribe(participation)
    @user = participation.user
    @organisation = participation.mission.organisation
    @mission = participation.mission
    
    mail(to: @user.email, subject: "RE: #{@organisation.name} - #{@mission.title}")
  end
end
