class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # This is called during the "create" method (a POST to /users), after the
  # new user is added to the database.
  def sign_up(resource_name, resource)
    super(resource_name, resource)
    if params[resource_name][:skills]
      skill_arr = params[resource_name][:skills].split(', ')
      skill_arr.each do |skill_name|
        skill = Skill.create(:name => skill_name)
        @user.skills << skill
      end
    end
    UserMailer.welcome_email(@user).deliver_now
  end

  # This is called during the "create" method, before the new user is added to
  # the database.
  def build_resource(hash = {})
    if (hash.present?)
      hash[:approved] = (hash[:organization] == "false")
    end
    super(hash)
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # GET /users/sign_up_org
  def new_org
    # We need this controller so that we can automatically generate fields in
    # the signup page. It's not really that automatic, so I'm not sure why it's
    # worth doing.
    @user = User.new
  end

  # This is called during the "create" method. Any POST parameters other than
  # these will be rejected.
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :address, :city, :state, :zip_code, :phone_number, :email,
                                 :password, :password_confirmation, :private, :name, :mission, :website, :organization)
  end

  # This is called during the "update" method (a PUT to /users). Any POST
  # parameters other than these will be rejected.
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :address, :city, :state, :zip_code, :phone_number, :email, :skills,
                                 :password, :password_confirmation, :private, :name, :mission, :website, :current_password)
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
  def update_resource(resource, params)
    if params[:skills]
      skill_arr = params[:skills].split(', ')
      @user.skills = []
      skill_arr.each do |skill_name|
        skill = Skill.create(:name => skill_name)
        @user.skills << skill
      end
    end
  end

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
