class UserMailer < ApplicationMailer
  default from: 'flavien_loiseau@hotmail.com'
 
  def contact_form(first_name, last_name, email, content)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @email_content = content

    admins_emails = []
    User.all.each do |u|
      if u.is_admin
        admins_emails << u.email
      end
    end

    mail(to: admins_emails, subject: "Contact from #{@first_name} #{@last_name}")
  end

  def mission_subscribe(user, organisation, mission)
    @user = user
    @organisation = organisation
    @mission = mission
    mail(to: @user.email, subject: "#{@organisation.name} - #{@mission.title}")
  end

  def mission_unsubscribe(user, organisation, mission)
    @user = user
    @organisation = organisation
    @mission = mission
    mail(to: @user.email, subject: "RE: #{@organisation.name} - #{@mission.title}")
  end
end
