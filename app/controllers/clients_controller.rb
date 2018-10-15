class ClientsController < ApplicationController
  require 'watir'
  require "watir-webdriver"
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(new_params)
    @client.save!
    redirect_to root_path
  end

  def open_tab
    client = Client.find_by(id: params[:id])
    infor = AuthInfor.find_by(user_id: current_user.id, client_id: params[:id])
    wb = Watir::Browser.new
    wb.goto client.login_url
    wb.text_field(:id,'email').set(infor.user_name)
    wb.text_field(:id,'pass').set(infor.password)
    wb.button(:name,"login").click
    wb.close
    redirect_to client.login_url
  end

  private
  def new_params
    params.require(:client).permit(:login_url, :name_app, :secret_key, :public_key, :auth_type)
  end
end