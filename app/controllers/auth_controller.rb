class AuthController < ApplicationController
  before_action :authenticate_access_token!
  before_action :authenticate_user!, except: :get_access_token
  skip_before_action :verify_authenticity_token, only: :get_access_token

  def authorize
    application = Client.find_by(public_key: params[:client_id])
    unless application
      redirect_to new_user_session_url
    end
    access_grant = AccessGrant.find_or_create_by(client_id: application.id, user_id: current_user.id)
    access_grant.create_token
    # access_grant = AccessGrant.find_by(client_id: application.id, user_id: current_user.id)
    # access_grant = AccessGrant.create(client_id: application.id, user_id: current_user.id) if access_grant.nil?
    redirect_to access_grant.generate_redirect_url(params[:redirect_uri], params[:state])
  end

  def get_access_token
    application = Client.authenticate(params[:client_id], params[:client_secret])
    if application.nil?
      render :json => {:error => "Could not find application"}
      return
    end

    access_grant = AccessGrant.authenticate(params[:code], application.id)
    if access_grant.nil?
      render :json => {:error => "Could not authenticate access code"}
      return
    end
    render :json => {:access_token => access_grant.access_token, :refresh_token => access_grant.refresh_token}
  end

  def get_info_user
    render json: {
      provider: 'sso',
      id: current_user.id.to_s,
      info: {
         email: current_user.email,
      }
    }.to_json
  end

  private
  def authenticate_access_token!
    if params[:oauth_token]
      access_grant = AccessGrant.find_by(access_token: params[:oauth_token])
      if access_grant&.user
        sign_in access_grant&.user
      end
    end
  end
end