class Organizations::ProfileController < ApplicationController
    #before_filter :authenticate_user!

  def show
    
    
    #grabs the current organizations id and then renders the profile page for them. 
    @organization = Organization.find(params[:id])

    render "show"
  end

end
