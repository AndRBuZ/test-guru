class FeedbackMailer < ApplicationMailer

  def feedback_email(current_user, message)
    @user = current_user
    @message = message
    @admin_email = ENV['ADMIN_EMAIL']
    mail(to: @admin_email, subject: "Message from #{@user.email}")
  end
end
