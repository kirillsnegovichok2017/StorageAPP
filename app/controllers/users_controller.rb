class UsersController < ApplicationController
  include UsersHelper

  before_action :logged_in_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: success_signup_message(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @records = @user.folder.records
    debugger
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

