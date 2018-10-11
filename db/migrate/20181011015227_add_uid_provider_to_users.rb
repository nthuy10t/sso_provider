class AddUidProviderToUsers < ActiveRecord::Migration[5.2]
  def change
    def change
      add_column :users, :uid, :string, index: true
      add_column :users, :provider, :string
    end
  end
end
