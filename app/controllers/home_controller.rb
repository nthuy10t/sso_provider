class HomeController < ApplicationController
  before_action :authenticate_user!, except: :extension_index
  before_action :check_authenticate, only: :extension_index
  def index
    @auth_infors = AuthInfor.all
  end

  def extension_index
    auth_infors = AuthInfor.all
    render :json => {'auth_infors' => auth_infors.as_json}, status: 200
  end
end