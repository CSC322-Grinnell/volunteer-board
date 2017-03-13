class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def volunteerboard
    render html: "Volunteer Board"
  end
  def cities
  render json: CS.cities(params[:state], :us).to_json
  end
end
