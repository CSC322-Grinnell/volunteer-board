class StaticPagesController < ApplicationController
def home
    @events = Event.all
end

def signup_options
end

def faq
end

# !!! Needs Testing !!!
    def approve_org
@organization = User.find(params[:id])
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
