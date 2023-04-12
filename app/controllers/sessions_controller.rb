class SessionsController < ApplicationController
  skip_before_action :login_required
  wrap_parameters :user

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id]=user.id
      redirect_to root_path, notice: 'ログインしました'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'ログアウトしました。'
  end

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
