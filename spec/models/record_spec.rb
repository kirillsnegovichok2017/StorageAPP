require 'rails_helper'

RSpec.describe Record, type: :model do

  before(:all) do
    @user = create(:user)
    @folder = @user.folder
    # pp @folder
    @file_name = Faker::File.file_name('root')
    @folder = create(:folder)
    pp @folder.records
    @file = @folder.records.create(name: @file_name, attachment: Faker::Internet.url)
    pp @file
    #@file = @folder.records.create(name: @file_name, attachment: Faker::Internet.url)
  end

  # it "record should be valid" do
  #   expect(@file).to be_valid
  # end

  it "asdasd" do

  end

  after(:all) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end
end
