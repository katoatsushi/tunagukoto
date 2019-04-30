class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  # before_action :authenticate_company!
  def after_sign_out_path_for(resource)
    root_path
  end
  protected

    def devise_parameter_sanitizer
  	if resource_class == User
  		User::ParameterSanitizer.new(User, :user, params)
  	else
  		super # Use the default one
    end
  end
end
