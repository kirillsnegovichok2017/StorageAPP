class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)

    if @record.save
      redirect_to records_path, notice: "The record #{@record.name} has been uploaded."
    else
      render 'new'
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path, notice: "The record #{@record.name} has been deleted."
  end

  private

  def record_params
    params.require(:record).permit(:name)
  end
end
