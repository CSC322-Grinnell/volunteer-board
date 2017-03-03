class AdminsController < InheritedResources::Base

  private

    def admin_params
      params.require(:admin).permit(:name, :email)
    end
end

