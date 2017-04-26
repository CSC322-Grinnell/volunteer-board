class ChangePhoneTypeInOrganization < ActiveRecord::Migration[5.0]
  def change
    change_column :organizations, :phone, :string
  end
end
