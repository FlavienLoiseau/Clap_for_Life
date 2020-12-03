class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show]

  def index
    @organisations = Organisation.search(params[:search])

  end

  def new
    @user = current_user
    @organisation = Organisation.new
  end

  def create
    puts organisation_params
    puts params[:organisation]
    @organisation = Organisation.new(organisation_params)
    puts organisation_params

    if @organisation.save
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
      :tag_ids,
      :activity_id
    )
  end

  # def address_attributes
  #   [
  #     :addressable_type,
  #     :addressable_id
  #     :number,
  #     :street,
  #     :city,
  #     :zipcode,
  #     :address_type,
  #     :country
  #   ]
  #
  # end

  # def tags_attributes
  #   [
  #     :name,
  #     :tagable_type,
  #     :tagable_id
  #   ]
  # end

end
