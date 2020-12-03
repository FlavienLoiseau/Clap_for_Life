class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :is_current_user]
  before_action :is_current_user, only: [:show]


  def edit
    # @user.build_address
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice:"Votre profil a été mis à jour !"
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
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
    unless current_user == @user
      redirect_to user_path(current_user)
    end
  end
end
