class RecordsController < ApplicationController
  include SessionsHelper

  def index
    #@records = Record.all
    @records = current_user.folder.records.all
  end

  def new
    @record = Record.new
  end

  def create
    #@record = Record.new(record_params)
    @record = current_user.folder.records.build(record_params)
    if @record.save
      #redirect_to records_path, notice: "The record #{@record.name} has been uploaded."
      redirect_to current_user, notice: "The record #{@record.name} has been uploaded."
    else
      render 'new'
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    #redirect_to records_path, notice: "The record #{@record.name} has been deleted."
    redirect_to current_user, notice: "The record #{@record.name} has been deleted."
  end

  private

  def record_params
    params.require(:record).permit(:name, :attachment)
  end
end
