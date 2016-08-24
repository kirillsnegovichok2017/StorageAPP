class ProfilesController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
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

def user_params
  params.require(:user).permit(:birth_date, :country, :language, :mobile)
end