class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def volunteerboard
    render html: "Volunteer Board"
  end
end
