class Client < ApplicationRecord
  has_many :access_grants
  def self.authenticate(app_id, app_secret)
    where(["public_key = ? AND secret_key = ?", app_id, app_secret]).first
  end
end
