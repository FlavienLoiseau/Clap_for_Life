class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :is_current_user]
  before_action :is_current_user, only: [:show]


  def edit
    @address = Address.new
  end

  def show
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def is_current_user
    unless current_user == @user
      redirect_to user_path(current_user)
    end
  end
end
