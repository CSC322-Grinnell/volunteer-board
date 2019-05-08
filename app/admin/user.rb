ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

 config.comments = false
  index do
    column :firstname
    column :lastname
    column :email
    actions
  end

  filter :firstname
  filter :lastname

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :firstname
      f.input :lastname
    end

   f.actions
  end

  member_action :reset_password do
    flash[:error] = "Please contact the administrator to change your password."
  end

  show :title =>  proc {|user| (user.organization ? user.name : user.firstname + " " + user.lastname) } do
    attributes_table :email, :firstname, :lastname, :name, :address, :city, :state, :zip_code, :phone_number
  end

  action_item :approve_org, only: :show, if: proc{ !(User.find(params[:id]).approved) } do
    link_to 'Approve Organization', controller: "/static_pages", action: "approve_org", id: params[:id]
  end
end
