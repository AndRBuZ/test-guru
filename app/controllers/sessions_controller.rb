class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:user_page) || root_path
    else
      flash.now[:alert] = 'Verify your Email and Password'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to tests_path
  end
end
