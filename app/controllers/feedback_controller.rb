class FeedbackController < ApplicationController
  def create
    FeedbackMailer.feedback_email(current_user, params[:message]).deliver_now
    redirect_to root_path, { notice: 'Email successfully sending' }
  end
end
