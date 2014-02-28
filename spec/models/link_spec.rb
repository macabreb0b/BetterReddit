# == Schema Information
#
# Table name: links
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  url            :string(255)
#  body           :string(255)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  upvote_count   :integer
#  downvote_count :integer
#

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
  it { should have_many :comments }

  describe "#comments_by_parent_id" do
    link = FactoryGirl.create(:link)

    it "returns a hash" do
      expect(link.comments_by_parent_id).to be_a(Hash)
    end

    it "returns values as array of comment objects" do
      expect(link.comments_by_parent_id[nil].first).to be_a(Comment)
    end

    it "fetches all comments with given parent_id"


  end
end
