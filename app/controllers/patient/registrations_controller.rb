class Patient::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def create
    params[:user] = params[:user]&.merge(type: 'Patient')
    super
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[type phone_number full_name email password])
  end
end
