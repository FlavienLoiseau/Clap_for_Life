class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def show

  end

  def edit
    @address = Address.new
    
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

end
