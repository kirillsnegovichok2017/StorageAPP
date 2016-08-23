class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :validates_and_redirect, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:notice] = 'Email sent with password reset instructions'
      redirect_to root_url
    else
      flash.now[:error] = 'Email address not found'
      render :new
    end
  end

  def edit

  end

  def update
    if password_blank?
      flash.now[:error] = "Password can't be blank"
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = 'Password has been reset.'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def validates_and_redirect
    unless @user.valid?
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def password_blank?
    params[:user][:password].blank?
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def check_expiration
    if @user.password_reset_expired?
      flash[:error] = 'Password reset has expired.'
      redirect_to new_password_reset_url
    end
  end

end
