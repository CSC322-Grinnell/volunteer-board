class StaticPagesController < ApplicationController
  def home
  end
  
<<<<<<< HEAD
  def signin_options
  end
  
  def signup_options
=======
  def faq
>>>>>>> 568ae37ee63579145c79dcc92f56279b6b2bd92c
  end
  
  # !!! Needs Testing !!!
  def approve_org
    @organization = Organization.find(params[:id])
    if admin_user_signed_in?
      @organization.approved = true
      if @organization.save
        flash[:notice] = "#{@organization.name} approved"
      else 
        
      end
      redirect_to '/admin'
    end
  end
end
