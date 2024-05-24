# Example for Devise registration controller
class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    build_resource({})
    resource.build_profile
    respond_with resource
  end
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, profile_attributes: [:first_name, :last_name, :patronym, :tel, :address, :date_of_birth, :gender])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :role, profile_attributes: [:first_name, :last_name, :patronym, :tel, :address, :date_of_birth, :gender])
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [profile_attributes: [:first_name, :last_name, :patronym, :tel, :address, :date_of_birth, :gender]])
  end

end
