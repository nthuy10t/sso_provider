class CreateAccessGrants < ActiveRecord::Migration[5.2]
  def change
    create_table :access_grants do |t|
      t.integer :client_id
      t.integer :user_id
      t.string :toke
      t.string :access_token
      t.string :refresh_token
      t.datetime :expires_at

      t.timestamps
    end
  end
end
