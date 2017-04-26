class Users::ProfileController < ApplicationController
#before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])

    render "show"
  end

end
