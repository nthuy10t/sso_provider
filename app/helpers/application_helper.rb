module ApplicationHelper
  def show_error_login?
    flash.present? && params[:action] == 'create'
  end

  def flash_notice_login(resource)
    if resource.invalid? && show_error_login?
      if resource.errors.details[:email].present?
        if resource.errors.details[:email][0][:error] == :taken
          resource.errors.delete(:email)
        end
      else
        resource.errors.add(:email, t('devise.failure.not_found_in_database'))
      end
    end
  end
  def error_class?(error)
    'has-error' if error.present?
  end

  def error_label?(error)
    'control-label' if error.present?
  end

  def get_authentication_url(ai)
    ai.auth_type == 'SSO' ? ai.login_url : open_tab_clients_path(id: ai.client_id)
  end
end
