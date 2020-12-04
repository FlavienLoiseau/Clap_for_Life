class MissionsController < ApplicationController
  before_action :set_mission, only: [:show]


  def index
    @missions = Mission.search(params[:search])
  end

  def show
    @missions = Mission.all
    @participation = Participation.new
  end

  def new
    @user = current_user
    @mission=Mission.new
    if @mission.address.blank?
      @mission.build_address
    end
  end

  def create
    if is_admin?
      @mission = Mission.new(mission_params)
      @mission.organisation_id = current_user.organisation.id
      if @mission.save 
        redirect_to root_path,  notice: "Votre mission a bien été créée"
      else
        redirect_to root,  notice: "Erreur lors de la création de votre mission"
      end
    else
      flash[:notice] = "Tu n'es pas administrateur de cette association"
    end
  end


  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(
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

  def is_admin?
    Organisation.where(user_id: current_user.id).exists?
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
