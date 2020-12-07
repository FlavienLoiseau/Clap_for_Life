class UserMailer < ApplicationMailer
  default from: 'flavien_loiseau@hotmail.com'
 
  def participation_success(user, organisation, mission)
    @user = user
    @organisation = organisation
    @mission = mission
    mail(to: user.email, subject: "#{@organisation.name} - #{@mission.title}")
  end
end
