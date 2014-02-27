class LinkSub < ActiveRecord::Base
  belongs_to :link, inverse_of: :link_subs
  belongs_to :sub
end
