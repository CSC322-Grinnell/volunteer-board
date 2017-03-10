class UsersController < InheritedResources::Base

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :address, :city, :state, :zip_code, :phone_number, :email, :password, :password_confirmation, :private)
    end
end

