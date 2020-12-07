class OrganisationMailer < ApplicationMailer
  default from: 'flavien_loiseau@hotmail.com'
 
  def new_user_participation(user, organisation, mission)
    @user = user
    @organisation = organisation
    @admin = User.find(@organisation.user_id)
    @mission = mission
    mail(to: @admin.email, subject: "#{@mission.title} - Nouvel inscrit")
  end
end
