class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    case resource
    when User
      user_profile_path(resource)
    when Organization
      organization_profile_path(resource)
    else
      root_path
    end
  end
end