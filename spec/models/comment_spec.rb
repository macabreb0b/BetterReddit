require 'spec_helper'

describe Comment do

  it "throws an error without a body" do
    comment = FactoryGirl.build(:comment, body: nil)
    expect(comment).to have(1).error_on(:body)
  end

  it { should belong_to :link }
  it { should belong_to :user }
  it { should have_many :child_comments }
  it { should belong_to :parent_comment }

  context "when parent comment" do
    it "does not have a parent_comment_id" do
      comment = FactoryGirl.create(:comment)
      expect(comment.parent_comment_id).to be_nil
    end
  end

  context "when child comment" do
    it "has parent_comment_id" do
      id = rand(10)
      comment = FactoryGirl.create(:comment)
      comment1 = comment.child_comments.build
      expect(comment1.parent_comment_id).to eq(comment.id)
    end
  end


end
