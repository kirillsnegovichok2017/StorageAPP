class FoldersController < ApplicationController
  include SessionsHelper

  before_action :authorization_filter
  #before_action :ownership_filter, unless: [:new, :create]

  def index
    @root = current_user.root
  end

  def new
    @folder = Folder.new
    @parent_id = params[:folder_id]
  end

  def create
    @folder = new_folder(folder_params)
    if @folder.save
      redirect_to current_user, notice: "The folder #{@folder.name} has been created."
    else
      render 'new'
    end
  end

  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy
    redirect_to current_user, notice: "The folder #{@folder.name} has been deleted."
  end


  private

  def folder_params
    params.require(:folder).permit(:name)
  end

  def new_folder(folder_params)
    folder = Folder.new(folder_params)
    folder.folder_id = params[:parent_id]
    folder.user_id = current_user.id
    return folder
  end
end
