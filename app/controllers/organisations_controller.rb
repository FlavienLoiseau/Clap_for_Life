class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show, :edit, :update, :destroy, :info]

  def index
    @organisations = Organisation.search(params[:search], params[:location])
  end

  def new
    if current_user.organisation.present?
      flash[:notice] = "Vous avez déjà créé une association (Une seule association par profil utilisateur)"
      redirect_to user_path(current_user.id)
    else
      @organisation = Organisation.new
      if @organisation.address.blank?
        @organisation.build_address
      end
    end
  end

  def create
    if current_user.organisation.present?
      flash[:notice] = "Vous avez déjà créé une association"
    else
      @organisation = Organisation.new(organisation_params)
      @organisation.user = current_user
      if @organisation.save
        redirect_to organisation_path(current_user.organisation), notice: "Votre association a bien été créée (Une seule association par profil utilisateur)"
      end
    end
  end

  def update
    @organisation.logo.attach(params[:logo])
    if @organisation.update(organisation_params)
      redirect_to organisation_path(current_user.organisation), notice:"Votre profil a été mis à jour !"
    else
      render :edit
    end
  end

  def destroy
    @organisation.destroy
    redirect_to user_path(current_user.id), notice:"Votre association a été supprimée !"
  end

  private

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  def organisation_params
    params.require(:organisation).permit(
      :logo,
      :name,
      :registration_number,
      :registration_date,
      :description,
      :activity_id,
      tag_ids:[],
      address_attributes: [address_attributes]
    )
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
