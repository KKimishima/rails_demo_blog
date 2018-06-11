class SessionsController < ApplicationController
  def new
  end

  def destroy
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      session[:user_id] = user.id
      redirect_to :root
    else
      render 'new'
    end
  end
end
