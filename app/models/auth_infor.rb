class AuthInfor < ApplicationRecord
  belongs_to :client
  belongs_to :user

  delegate :login_url, to: :client, prefix: true
  delegate :auth_type, to: :client, prefix: true
  delegate :name_app, to: :client, prefix: true
end
