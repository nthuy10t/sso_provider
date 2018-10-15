class AddAuthTypeToClient < ActiveRecord::Migration[5.2]
  def change
    remove_column :auth_infors, :auth_type
    add_column :clients, :auth_type, :string
  end
end
