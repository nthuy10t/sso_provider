class AddAuthTypeToAuthInfor < ActiveRecord::Migration[5.2]
  def change
    add_column :auth_infors, :auth_type, :string
  end
end
