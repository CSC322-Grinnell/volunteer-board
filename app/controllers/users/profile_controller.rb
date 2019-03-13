class Users::ProfileController < ApplicationController
#before_filter :authenticate_user!

  #grabs the current users id and then renders the profile page for them.
  def show
    @user = User.find(params[:id])

    render "show"
  end

  #gets a list of all users and then renders them in a list through users/profile/list.html.erb
  def list
    @users = User.where(organization: false)

    render "list"
  end

  #gets a list of all organizations and then renders them in a list through users/profile/list_org.html.erb
  def list_org
    @users = User.where(organization: true)

    render "list_org"
  end

end
