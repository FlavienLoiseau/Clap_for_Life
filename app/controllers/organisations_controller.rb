class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show]

  def index
    @organisations = Organisation.all
  end

  def show

  end


  private

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

end
