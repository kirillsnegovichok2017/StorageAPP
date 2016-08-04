class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user and user.authenticate(params[:session][:password])
      log_in user
      debugger
      redirect_to user
    else
      flash.now[:error] = login_err_msg
      render 'new'
    end
  end

  def destroy
  end

end
