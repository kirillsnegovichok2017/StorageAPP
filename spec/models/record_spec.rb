require 'rails_helper'

RSpec.describe Record, type: :model do

  before(:all) do
    @user = create(:user)
    #pp @user
    @folder = @user.folder
    #pp @folder
    @file_name = Faker::File.file_name('root')
    @attach_url = Faker::Internet.url
    @file = @folder.records.create(name: @file_name)
    #pp @file
  end

  it "should be valid" do
    expect(@file).to be_valid
  end

  it "user can get created file throw folder" do
    f = @user.folder.records.find_by(name: @file_name)
    expect(f).not_to be nil
    pp f
  end

  after(:all) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end
end
