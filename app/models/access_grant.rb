class AccessGrant < ApplicationRecord
  belongs_to :user
  belongs_to :client

  def self.prune!
    # delete_all(["created_at < ?", 2.days.ago])
    where("created_at < ?", 2.days.ago).destroy_all
  end

  def create_token
    self.access_token = SecureRandom.hex(16)
    self.token = SecureRandom.hex(16)
    self.refresh_token = SecureRandom.hex(16)
  end

  def generate_redirect_url(redirect_uri, state)
    if redirect_uri =~ /\?/
      "#{redirect_uri}&code=#{token}&response_type=code&state=#{state}"
    else
      "#{redirect_uri}?code=#{token}&response_type=code&state=#{state}"
    end
  end

  def self.authenticate(code, application_id)
    AccessGrant.where("token = ? AND client_id = ?", code, application_id).first
  end
end
