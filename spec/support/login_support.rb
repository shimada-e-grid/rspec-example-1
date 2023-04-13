module LoginSupport
  def login_user(user)
    session[:user_id] = user.id
  end

  def logout_user
    session.delete(:user_id)
  end
end