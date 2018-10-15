class AuthInforsController < ApplicationController
  def edit
    @auth_infor = AuthInfor.find_by(id: params[:id])
  end

  def update
    auth_infor = AuthInfor.find_by(edit_params[:id])
    auth_infor.update_attributes(edit_params)
    redirect_to root_path
  end

  private
  def edit_params
    params.require(:auth_infor).permit(:id, :login_url, :user_name, :password)
  end
end