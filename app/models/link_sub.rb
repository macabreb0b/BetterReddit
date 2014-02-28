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

class LinkSub < ActiveRecord::Base
  belongs_to :link, inverse_of: :link_subs
  belongs_to :sub
end
