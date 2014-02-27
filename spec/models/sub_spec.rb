# == Schema Information
#
# Table name: subs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Sub do
  it "does not validate a sub without a name" do
    sub = FactoryGirl.build(:sub, name: nil)
    expect(sub).not_to be_valid
  end

  it "does not validate a sub without a moderator" do
    sub = FactoryGirl.build(:sub, user_id: nil)
    expect(sub).not_to be_valid
  end

  it { should belong_to :moderator }
  it { should have_many :link_subs }
end
