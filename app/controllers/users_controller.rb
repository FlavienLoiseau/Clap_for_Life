class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :is_current_user]
  before_action :is_current_user, only: [:show]


  def edit
    @user.build_address
  end

  def show
  end

  def update

  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user)
          .permit(:first_name,
                  :last_name,
                  address_attributes: [:number, :street, :city,
                    :zipcode, :country, :address_type])
  end

  def is_current_user
    unless current_user == @user
      redirect_to user_path(current_user)
    end
  end
end
