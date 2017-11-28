class UserMailer < ApplicationMailer
    
#  default from: 'notifications@example.com'
 
#  def welcome_email(user)
#    @user = user
#    @url  = 'http://example.com/login'
#    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
#  end


class UsersController < ApplicationController
  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
 
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver_now
 
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end

end
