class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    def volunteer_board
    render html: "Welcome to Volunteer Board"
    end
end
