class ChangeZipCodeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :organizations, :zip, :string
  end
end
