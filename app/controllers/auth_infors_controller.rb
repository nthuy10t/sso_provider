class AuthInforsController < ApplicationController
  before_action :check_authenticate, only: :auth_infor
  def index
    @clients = Client.all
  end

  def new
    @auth_infor = AuthInfor.new(client_id: params[:client_id], user_id: current_user.id)
  end

  def create
    auth_infor = AuthInfor.create(auth_params)
    redirect_to root_path
  end

  def edit
    @auth_infor = AuthInfor.find_by(id: params[:id])
  end

  def update
    auth_infor = AuthInfor.find_by(id: params[:auth_infor][:id])
    auth_infor.update_attributes(auth_params)
    redirect_to root_path
  end

  def infor_authen
    auth_infor = AuthInfor.find_by(client_name: params[:client], user_id: current_user.id)
    render json: {error: 'Not found'}, status: 400 and return if auth_infor.blank?
    render json: {infor: auth_infor.as_json}
  end

  private
  def auth_params
    params.require(:auth_infor).permit(:client_id, :user_name, :password).merge(user_id: current_user.id)
  end
end