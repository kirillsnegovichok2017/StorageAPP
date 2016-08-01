require 'rails_helper'
require 'database_cleaner'
require 'pp'

RSpec.describe Folder, type: :model do

  before(:all) do
    @user = create(:user)
    @folder_name = Faker::Lorem.word
    @user.folders.create(name: @folder_name, info: Faker::Lorem.sentence)
    @folder = @user.folders.find_by(name: @folder_name)
    #pp @folder
  end

  it "folder should be valid" do
    expect(@folder).to be_valid
  end

  it "folder shoud have a user" do
    expect(@folder.user_id).to be > 0
  end

  it "folder should have a link to it user" do
    expect(@folder.user).not_to be nil
  end

  after(:all) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

end
