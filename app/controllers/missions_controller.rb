class MissionsController < ApplicationController
  before_action :set_mission, only: [:show]

  def show
    @missions=Mission.all
  end


  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

end
