class RecordsController < ApplicationController
  include SessionsHelper

  before_action :authorization_filter
  #before_action :ownership_filter, unless: [:new]

  def index
    @records = Folder.find_by(folder_id: params[:folder_id])
  end

  def new
    @record = Record.new
    @parent_id = params[:folder_id]
  end

  def create
    @record = create_record(record_params)
    if @record.save
      redirect_to current_user, notice: "The record #{@record.name} has been uploaded."
    else
      render 'new'
    end
  end

  def destroy
    @record = Record.find(params[:id]).destroy
    redirect_to current_user, notice: "The record #{@record.name} has been deleted."
  end

  private

  def record_params
    params.require(:record).permit(:attachment)
  end

  def create_record(record_params)
    record = Record.new(record_params)
    record.folder_id = params[:parent_id]
    return record
  end

end
