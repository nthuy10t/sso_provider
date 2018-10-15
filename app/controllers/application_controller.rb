class ApplicationController < ActionController::Base
  def check_authenticate
    unless current_user
      render :json => {'error' => 'authentication error'}, :status => 401
    end
  end
end
