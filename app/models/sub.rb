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

class Sub < ActiveRecord::Base
  validates :name, :user_id, :presence => true
  has_many :link_subs, inverse_of: :sub
  has_many :links, through: :link_subs, source: :link

  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"
end
