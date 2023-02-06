class Admin::BadgesController < Admin::BaseController
  before_action :set_rules, only: %i[new create]
  before_action :set_img, only: %i[new create]

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :img_name, :rule, :rule_parameter)
  end

  def set_rules
    @rules = Badge::RULES
  end

  def set_img
    @img = Dir.glob('app/assets/images/badges/*.png').map! { |img| img.split('/').last }
  end
end
