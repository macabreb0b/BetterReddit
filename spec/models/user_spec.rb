# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  password_digest :string(255)      not null
#  username        :string(255)      not null
#  token           :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do
  it "is not valid without a username" do
    user  = FactoryGirl.build(:user, username: nil)
    expect(user).not_to be_valid
  end

  it "is not valid with same username" do
    user1 = FactoryGirl.create(:user, username: "joe")
    user2 = FactoryGirl.build(:user, username: "joe")

    expect(user2).not_to be_valid
  end

  it "does not validate password under 6 characters" do
    user = FactoryGirl.build(:user, password: "xyz")
    expect(user).not_to be_valid
  end

  it "does not store password in database" do
    FactoryGirl.create(:user)
    user = User.all.last
    expect(user.password).to be_nil
  end

  describe "set_token" do
    it "gives new user a session token" do
      user = FactoryGirl.build(:user)
      user.set_token
      expect(user.token).not_to be_nil
    end
  end

  describe "is_password?" do
    it "returns false for incorrect password" do
      user = FactoryGirl.create(:user, password: "password")
      expect(user.is_password?("not_password")).to be(false)
    end
  end

  describe "find_by_creds" do
    it "should find user with given username and password" do
      user = FactoryGirl.create(:user, username: "UserName", password: "PassyWord")
      user1 = User.find_by_credentials("UserName", "PassyWord")
      expect(user1.username).to eq user.username
    end

    it "should not find user with given incorrect password" do
      user = FactoryGirl.create(:user, username: "UserName", password: "PassyWord")
      user1 = User.find_by_credentials("UserName", "Beach")
      expect(user1).to be_nil
    end
  end

  describe "reset_session_token" do
    FactoryGirl.create(:user)
    it "returns a session token" do
      user = User.all.last
      expect(user.reset_session_token!).to be_a(String)
    end

    it "changes user's session token" do
      user = User.last
      old_token = user.token
      user.reset_session_token!
      expect(User.last.token).not_to eq old_token
    end
  end

  it { should have_many :subs }
  it { should have_many :links }
  it { should have_many :comments}
end
