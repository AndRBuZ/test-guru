class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_requierd!

  private

  def admin_requierd!
    redirect_to root_path, alert: 'Not enough rights' unless current_user.is_a?(Admin)
  end
end