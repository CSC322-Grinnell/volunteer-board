class UserMailer < ApplicationMailer
  default from: 'GPCFvolunteerboard@gmail.com'
   #hi
  def welcome_email(user)
    @user = user
    #change to actual address once deployed
    @url  = 'https://lit-brook-63057.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Volunteer Board!')
  end
  
end
