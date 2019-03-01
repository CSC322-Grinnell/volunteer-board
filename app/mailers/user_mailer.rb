class UserMailer < ApplicationMailer
   
  def welcome_email(user)
    @user = user
    @url  = 'https://lit-brook-63057.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Volunteer Board!')
  end
  
  def signup_email(user)
    @user = user
    @url  = 'https://lit-brook-63057.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'You successfully signed up for' + @user.events.last.name)
  end
  
  def reset_email(user)
    @user = user
    mail(to: @user.email, subject: 'You requested to change your password for ' + @user.email)
  end
  
end
