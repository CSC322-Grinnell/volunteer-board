class Organizations::ProfileController < ApplicationController
    #before_filter :authenticate_user!

  def show
    
    
    #grabs the current organizations id and then renders the profile page for them. 
    @organization = Organization.find(params[:id])

    render "show"
  end
  
  #creates a list of all the organization and displays it through organizations/profile/list.html.erb
  def list 
    @organizations = Organization.all
    
    render "list"
  end

end
