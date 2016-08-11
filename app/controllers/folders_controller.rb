class FoldersController < ApplicationController
  include SessionsHelper

  before_action :authorization_filter
  before_action :ownership_filter, unless: [:new]

  def index
  end

  def new
    @folder = Folder.new
  end

  def create
  end

  def destroy
  end
end
