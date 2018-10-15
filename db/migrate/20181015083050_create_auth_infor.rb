class CreateAuthInfor < ActiveRecord::Migration[5.2]
  def change
    create_table :auth_infors do |t|
      t.integer :client_id
      t.integer :user_id
      t.string :user_name
      t.string :password
      t.string :login_url
    end
  end
end
