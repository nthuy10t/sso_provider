class AddLoginUrlToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :login_url, :string
    remove_column :auth_infors, :login_url
  end
end
