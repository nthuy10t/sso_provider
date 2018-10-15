class ClientsController < ApplicationController
  require 'watir'
  require "watir-webdriver"
  def new
    @client = Client.new
  end

  def open_tab
    client = Client.find_by(params[:id])
    infor = AuthInfor.find_by(user_id: current_user.id, client_id: params[:id])
    wb = Watir::Browser.new
    wb.goto infor.login_url
    wb.text_field(:id,'email').set(infor.user_name)
    wb.text_field(:id,'pass').set(infor.password)
    wb.button(:name,"login").click
    wb.close
    redirect_to infor.login_url
  end
end