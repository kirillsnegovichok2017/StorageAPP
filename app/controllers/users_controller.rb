class UsersController < ApplicationController
  include UsersHelper

  before_action :authorization_filter, only: [:show]
  before_action :ownership_filter, unless: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user, notice: success_signup_message(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @root = @user.folder
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

