class AuthInforsController < ApplicationController
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
    auth_infor = AuthInfor.find_by(auth_params[:id])
    auth_infor.update_attributes(auth_params)
    redirect_to root_path
  end

  private
  def auth_params
    params.require(:auth_infor).permit(:id, :client_id, :user_name, :password).merge(user_id: current_user.id)
  end
end