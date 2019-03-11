class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # This is called during the "create" method (a POST to /users), after the
  # new user is added to the database.
  def sign_up(resource_name, resource)
    super(resource_name, resource)
    UserMailer.welcome_email(@user).deliver_now
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  #this code lets devise track the different values during sign up
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :address, :city, :state, :zip_code, :phone_number, :email, :password, :password_confirmation, :private)
  end
  #this code lets devise track the different values during an account information update
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :address, :city, :state, :zip_code, :phone_number, :email, :password, :password_confirmation, :current_password, :private)
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
