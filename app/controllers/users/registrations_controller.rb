class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [ :create ]

  def create
    ActiveRecord::Base.transaction do
      organization = Organization.find_or_create_by!(name: sign_up_params[:organization_name])

      # ユーザーを作成し、デフォルトでroleをadminに設定
      build_resource(sign_up_params.except(:organization_name).merge(organization: organization, role: :admin))

      resource.save!
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    rescue ActiveRecord::RecordInvalid
      render :new
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :email, :password, :password_confirmation, :organization_name ])
  end
end
