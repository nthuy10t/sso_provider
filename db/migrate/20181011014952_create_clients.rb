class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :secret_key
      t.string :public_key
      t.string :name_app
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
