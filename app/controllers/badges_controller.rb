class BadgesController < ApplicationController
  def index
    @badges = Badge.all.pluck(:img_name)
    @user_badges = current_user.badges.pluck(:img_name)
  end
end
