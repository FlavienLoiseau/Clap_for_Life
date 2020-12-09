class ParticipationsController < ApplicationController
  before_action :authenticate_user!

  def create
    if already_participated?
      flash[:notice] = "Tu participes déjà"
    else
      @participation = Participation.new(participation_params)
      if @participation.save
        redirect_to organisation_mission_path(@participation.mission.organisation, @participation.mission), notice: "Vous êtes bien inscrits"
        UserMailer.mission_subscribe(@participation).deliver_now
        OrganisationMailer.new_user_participation(@participation).deliver_now
      else
        redirect_to organisation_mission_path(@participation.mission.organisation, @participation.mission), flash[:warning]= "Erreur"
      end
    end
  end

  def destroy
    @participation = Participation.where(mission_id: params[:mission_id], user_id: current_user.id).first
    if @participation.present?
      @participation.destroy
      UserMailer.mission_unsubscribe(@participation).deliver_now
      redirect_to organisation_mission_path(@participation.mission.organisation, @participation.mission), notice: "Vous êtes bien désinscrits "
    end
  end

  private

  def already_participated?
    Participation.where(mission_id: params[:mission_id], user_id: current_user.id).exists?
  end

  def participation_params
    params.require(:participation).permit(
      :mission_id,
      :user_id
    )
  end

end
