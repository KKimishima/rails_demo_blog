module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    p @current_user
  end

  def login_in?
    current_user.present?
  end

  def session_id_is?
    session[:user_id]
  end

  def log_in(user)
    reset_session
    session[:user_id] = user.id
  end

  def log_out
    reset_session
    @current_user = nil
  end

  def login_user_is
    current_user.name
  end
end
