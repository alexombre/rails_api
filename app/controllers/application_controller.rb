require "application_responder"

class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  self.responder = ApplicationResponder
  include ActionController::MimeResponds
  respond_to :json
  
  
  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
  end
end
