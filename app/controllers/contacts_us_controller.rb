class ContactsUsController < ApplicationController
  def new
  end

  def create
    @name = params[:contact][:name]
    @email = params[:contact][:email]
    @message = params[:contact][:message]
    # send this message to my email
  end
end
