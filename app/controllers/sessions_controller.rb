class SessionsController < ApplicationController
  def new
  end

  def destroy
    log_out
    redirect_to login_url
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to :root
    else
      flash.now[:danger] = "Emailかパスワードが間違えています"
      render 'sessions/new'
    end
  end
end
