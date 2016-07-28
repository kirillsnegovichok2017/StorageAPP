require 'rails_helper'

RSpec.describe User, type: :model do

  before :all do
    @user = User.new(name: "User Name", email: "user@gmail.com")
  end

  it "name should be valid" do
    @user.name = "    "
    expect(@user).to be_valid
  end

end
