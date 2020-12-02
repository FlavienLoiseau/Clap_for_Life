class MissionsController < ApplicationController
  before_action :set_mission, only: [:show]

  def show

  end


  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

end
