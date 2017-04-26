class Organizations::ProfileController < ApplicationController
    #before_filter :authenticate_user!

  def show
    @organization = Organization.find(params[:id])

    render "show"
  end

end
