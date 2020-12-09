class UserMailer < ApplicationMailer
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
