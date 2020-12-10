class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :is_current_user]
  before_action :is_current_user, only: [:show]

  def edit
    @user.build_address if @user.address.blank?
  end

  def show
  end

  def update
    @user.avatar.attach(params[:avatar])
    if @user.update(user_params)
      @user.update_attribute(:avatar, params[:user][:avatar])
      redirect_to user_path, notice:"Votre profil a été mis à jour !"
    else
      render :edit
    end
  end

  def missions
    @user = current_user
    @missions = Mission.all
    @participations = Participation.all
  end

  def success
    @user = current_user
    @success = current_user.badges
    @badges = Merit::Badge.all
    @interrogation = Merit::Badge.find(1)

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :avatar,
      :username,
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :date_of_birth,
      address_attributes:[
        :number,
        :street,
        :city,
        :zipcode,
        :address_type,
        :country
      ]
    )
  end

  def is_current_user
		redirect_to user_path(current_user) unless current_user == @user
  end

end
