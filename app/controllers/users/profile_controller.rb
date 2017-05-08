class Users::ProfileController < ApplicationController
#before_filter :authenticate_user!

  #grabs the current users id and then renders the profile page for them. 
  def show
    @user = User.find(params[:id])
    @events = @user.events

    render "show"
  end
  
  #gets a list of all users and then renders them in a list through users/profile/list.html.erb
  def list 
    @users = User.all
    
    render "list"
  end

end
