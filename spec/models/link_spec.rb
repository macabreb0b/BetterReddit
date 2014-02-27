require 'spec_helper'

describe Link do
  it "throws an error without a title" do
    link = FactoryGirl.build(:link, title: nil)
    expect(link).to have(1).error_on(:title)
  end

  it "throws an error without a url" do
    link = FactoryGirl.build(:link, url: nil)
    expect(link).to have(1).error_on(:url)
  end

  it "does not throw error without a body" do
    link = FactoryGirl.build(:link, body: nil)
    expect(link).to be_valid
  end

  it "throws an error without a user_id" do
    link = FactoryGirl.build(:link, user_id: nil)
    expect(link).to have(1).error_on(:user_id)
  end

  it { should belong_to :user }
  it { should have_many :link_subs }
end
