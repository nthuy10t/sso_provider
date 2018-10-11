class ChangeNameTokenColumnAccessGrant < ActiveRecord::Migration[5.2]
  def change
    rename_column :access_grants, :toke, :token
  end
end
