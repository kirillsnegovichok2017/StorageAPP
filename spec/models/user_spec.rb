require 'rails_helper'
require 'database_cleaner'
require 'pp'


RSpec.describe User, type: :model do

  before :all do
    @user = create(:user)
  end

  before :each do
    @user.name = "folder_name"
    @user.email = "valid_email@gmail.com"
  end

  it "should be valid" do
    expect(@user).to be_valid
  end

  it "should have root folder" do
    expect(@user.folders.find_by(name: "root")).not_to be nil
  end


  it "name should be valid" do
    @user.name = "    "
    expect(@user).not_to be_valid
  end

  it "email should be valid" do
    valid_emails = %w[rufs.@gmail.com roierjAF@mail.ru ]
    valid_emails.each do |valid_email|
      @user.email = valid_email
      expect(@user).to be_valid
    end
  end

  it "emails not to be valid" do
    invalid_emails = %w[rufs.gmail.com roierjAF@mailru ]
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      expect(@user).not_to be_valid
    end
  end


  it "name length should not be longer then 50 chars" do
    @user.name = "a" * 51
    expect(@user).not_to be_valid
  end

  it "email should not be longer then 255 chars" do
    @user.email = "e" * 256
    expect(@user).not_to be_valid
  end

  after(:all) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

end
