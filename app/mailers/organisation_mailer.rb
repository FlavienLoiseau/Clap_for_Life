class OrganisationMailer < ApplicationMailer
  def new_user_participation(participation)
    @user = participation.user
    @organisation = participation.mission.organisation
    @mission = participation.mission
    @admin = User.find(@organisation.user_id)
    
    mail(to: @admin.email, subject: "#{@mission.title} - Nouvel inscrit")
  end
end
