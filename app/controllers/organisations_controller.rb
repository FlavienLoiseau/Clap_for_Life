class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show]

  def index
    @organisations = Organisation.search(params[:search])
  end

  def new
    @user = current_user
    @organisation = Organisation.new
    if @organisation.address.blank?
      @organisation.build_address
    end
  end

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.user = current_user
    if @organisation.save && @organisation.address.save
      redirect_to organisations_path, notice: "Votre association a bien été créée"
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
