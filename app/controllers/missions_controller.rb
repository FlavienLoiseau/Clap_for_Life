class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :update, :destroy, :edit, :info]

  def index
    @missions = Mission.search(params[:search], params[:location], params[:start_date]).sort_by(&:start_date)
  end

  def new
    @mission=Mission.new
    @mission.build_address if @mission.address.blank?
  end

  def show
    @missions = Mission.all
    @participation = Participation.new
    @street= Mission.street(params[:id])
  end

  def create
    if has_organisation?
      @mission = Mission.new(mission_params)
      @mission.organisation_id = current_user.organisation.id
      if @mission.save
        redirect_to missions_dashboard_path,  notice: "Votre mission a bien été créée"
      else
        render :new,  notice: "Erreur lors de la création de votre mission"
      end
    else
      flash[:notice] = "Tu n'es pas administrateur de cette association"
    end
  end

  def update
    @mission.cover.attach(params[:cover])
    if @mission.update(mission_params)
      redirect_to missions_dashboard_path, notice:"Votre mission a été mise à jour !"
    else
      render :edit
    end
  end

  def destroy
    @mission.destroy
    redirect_to missions_dashboard_path, notice:"Votre mission a été supprimée !"
  end

  private
  
  def set_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(
      :cover,
      :title,
      :contact_first_name,
      :contact_last_name,
      :contact_phone,
      :description,
      :start_date,
      :end_date,
      :volunteers_needed,
      tag_ids:[],
      address_attributes: [address_attributes]
     )
  end

	def has_organisation?
	  current_user.organisation.present?
	end

  def address_attributes
    [
      :addressable_type,
      :addressable_id,
      :number,
      :street,
      :city,
      :zipcode,
      :address_type,
      :country
    ]
  end
end