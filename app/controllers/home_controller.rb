class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @auth_infors = AuthInfor.all
  end
end