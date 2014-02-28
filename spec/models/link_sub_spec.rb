# == Schema Information
#
# Table name: link_subs
#
#  id         :integer          not null, primary key
#  link_id    :integer
#  sub_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe LinkSub do
  it { should belong_to :sub }
  it { should belong_to :link }
end
