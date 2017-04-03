class OrganizationsController < InheritedResources::Base

  private

    def organization_params
      params.require(:organization).permit(:name, :address, :city, :state, :zip, :phone, :email, :mission, :website, :password, :confirm)
    end
end

