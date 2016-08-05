class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def authorization_filter
    unless logged_in?
      flash[:error] = 'Please log in.'
      redirect_to login_url
    end
  end

  def ownership_filter
    @user = User.find(params[:id])
    redirect_to(root_url) unless owner?(@user)
  end

end
