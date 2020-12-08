class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :update, :destroy, :info]


  def index
    @missions = Mission.search(params[:search], params[:location])
  end

  def new
    @user = current_user
    @mission=Mission.new
    if @mission.address.blank?
      @mission.build_address
    end
  end

  def show
    @missions = Mission.all
    @participation = Participation.new
    @street= Mission.street(params[:id])
  end

  def create
    if is_admin?
      @mission = Mission.new(mission_params)
      @mission.cover.attach(params[:cover])
      @mission.organisation_id = current_user.organisation.id
      if @mission.save
        redirect_to "/home/dashboard",  notice: "Votre mission a bien été créée"
      else
        redirect_to root,  notice: "Erreur lors de la création de votre mission"
      end
    else
      flash[:notice] = "Tu n'es pas administrateur de cette association"
    end
  end

  def edit
    @user = current_user
    @mission=Mission.find(params[:id])
  end

  def update
    @mission.cover.attach(params[:cover])
    if @mission.update(mission_params)
      redirect_to "/home/dashboard", notice:"Votre mission a été mis à jour !"
    else
      render :edit
    end
  end

  def destroy
    @mission.destroy
    redirect_to root_path, notice:"Votre mission a été supprimée !"
  end

  def info
    @user = current_user
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

  def picture_params
    params.require(:mission).permit(:picture)
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
