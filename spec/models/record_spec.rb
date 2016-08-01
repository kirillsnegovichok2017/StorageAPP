require 'rails_helper'

RSpec.describe Record, type: :model do

  before(:all) do
    @user = create(:user)
    @folder = @user.root_folder
    @file_name = Faker::File.file_name('root')
    @file = @folder.records.create(name: @file_name, attachment: Faker::Internet.url)
  end

  it "record should be valid" do
    expect(@file).to be_valid
  end


  after(:all) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end
end
