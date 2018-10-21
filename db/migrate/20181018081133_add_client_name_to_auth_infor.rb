class AddClientNameToAuthInfor < ActiveRecord::Migration[5.2]
  def change
    add_column :auth_infors, :client_name, :string
  end
end
