class UsersController < ApplicationController
  before_action :require_login
  before_action :set_users, only: [:edit, :update, :show]

  def show

  end

  def edit
  end

  def update
    if @user && @user.authenticate(params[:user][:old_password])
      @user.update(user_params)
      redirect_to :root
    else
      flash.now[:danger] = "パスワードが間違えています"
      render 'users/edit'
    end
  end

  private

  def require_login
    unless login_in? && params[:id].to_i == session_id_is?.to_i
      redirect_to root_url
    end
  end

  def set_users
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmatiod)
  end
end
