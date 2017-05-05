class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def volunteer_board
    render html: "Welcome to Volunteer Board"
  end
    
  def index
    if user_signed_in?
      @user = current_user
    elsif organization_signed_in?
      @org = current_organization
    end
  end

  def approve_org
    org = Organization.find(params[:id])
    org.update(approved: true)
    if org.save
      flash[:notice] = "#{org.name} approved"
    else
      # flash[:alert] = "#{org.orgname} approval failure"
    end
    redirect_to '/admin'
  end
end
