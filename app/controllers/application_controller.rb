class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_current_organization, unless: :devise_controller?

  def set_current_organization
    @current_organization = Organization.find_by!(name: params[:organization_name])
  end

  protected

  def devise_controller?
    is_a?(Devise::RegistrationsController) || is_a?(Devise::SessionsController)
  end
end
