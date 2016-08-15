class FoldersController < ApplicationController
  include SessionsHelper

  before_action :authorization_filter
  #before_action :ownership_filter, unless: [:new, :create]

  def index
    @root = current_user.folder
    #@folders = Folder.where(folder_id: params[:folder_id])
    #@records = @folder.records
  end

  def new
    @folder = Folder.new
    @parent_id = params[:folder_id]
  end

  def create
    @folder = create_folder(folder_params)
    if @folder.save
      redirect_to current_user, notice: "The folder #{@folder.name} has been created." and return
    else
      render 'new'
    end
  end

  def destroy
    Folder.find(params[:folder_id]).destroy
    redirect_to current_user, notice: "The folder #{@folder.name} has been deleted."
  end


  private

  def folder_params
    params.require(:folder).permit(:name)
  end

  def create_folder(folder_params)
    folder = Folder.new(folder_params)
    folder.folder_id = params[:parent_id]
    return folder
  end
end
