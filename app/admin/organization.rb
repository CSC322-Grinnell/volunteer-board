ActiveAdmin.register Organization do
  config.comments = false
  
  
  index do
    column :name
    column :email
    column :contact_name
    column :approved
    actions
  end

  filter :email

  form do |f|
    
    f.inputs 'Admin Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
    
  end
  
  show do
    attributes_table :name, :email, :approved, :contact_name, :address, :city, :state, :zipcode, :telephone, :about
  end
  
  # Adds "Approve" button, if organization isn't approved yet
  # !!! Needs testing !!!
  # Useful pages:
  # https://www.google.com/search?q=edit+active+admin+show+actions
  # https://github.com/activeadmin/activeadmin/issues/341
  # http://activeadmin.info/docs/8-custom-actions.html

  
#  action_item :view_as_user, only: :show do
#    link_to "View As User", org_path(params[:id])
 # end

  
  action_item :approve_org, only: :show, if: proc{ !(Organization.find(params[:id]).approved) } do
    link_to 'Approve Organization', controller: "/static_pages", action: "approve_org", id: params[:id]
  end




end