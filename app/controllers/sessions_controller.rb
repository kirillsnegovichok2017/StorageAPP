class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user and user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or user
    else
      flash.now[:error] = login_err_msg
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
