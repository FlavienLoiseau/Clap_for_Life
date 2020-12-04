class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show]

  def index
    @organisations = Organisation.search(params[:search])
  end

  def new
    if current_user.organisation.present?
      flash[:notice] = "Vous avez déjà créé une association (Une seule organisation par profil utilisateur)"
      redirect_to user_path(current_user.id)
    else
      @user = current_user
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
        redirect_to organisations_path, notice: "Votre association a bien été créée (Une seule organisation par profil utilisateur)"
      end
    end
  end

  def show

  end


  private

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  def organisation_params
    params.require(:organisation).permit(
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
