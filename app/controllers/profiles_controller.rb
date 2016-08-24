class ProfilesController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    update_user @user
    #if @user.update_attributes(user_params)
    #debugger
    if @user.save
      flash[:notify] = 'User profile is updated!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = current_user
  end
end


private

def update_user(user)
  user.birth_date = params[:user][:birth_date]
  user.country = params[:user][:country]
  user.language = params[:user][:language]
  user.mobile = params[:user][:mobile]
end

def user_params
  params.require(:user).permit(:birth_date, :country, :language, :mobile)
end