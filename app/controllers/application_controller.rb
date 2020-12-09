class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :set_locale

# @user=current_user

  private

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(
        :username, :email, :password, :password_confirmation
      )
    }
    devise_parameter_sanitizer.permit(:account_update){|u| u.permit(
        :first_name, :last_name, :username, :email,
        :password, :password_confirmation,
        :phone_number, :date_of_birth
      )
    }
  end

  def set_locale
    if params[:locale]
      I18n.locale = params[:locale]
    end
  end
end
