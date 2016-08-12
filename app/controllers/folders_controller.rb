class FoldersController < ApplicationController
  include SessionsHelper

  before_action :authorization_filter
  before_action :ownership_filter, unless: [:new]

  def index
    @folders = current_user.folders
  end

  def new
    @folder = Folder.new
  end

  def create
    #@folder = current_user.fo
  end

  def destroy
  end


  private

  def record_params
    params.require(:folder).permit(:name)
  end
end
