class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  helper_method :admin?

  def after_sign_in_path_for(resoures)
    if resoures.is_a?(Admin)
      admin_tests_path
    else
      root_path
    end
  end

  def default_url_options
    I18n.locale != I18n.default_locale ? { lang: I18n.locale } : { }
  end

  protected

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def admin?
    current_user.is_a?(Admin)
  end
end
