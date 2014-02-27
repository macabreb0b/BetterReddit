class Link < ActiveRecord::Base
  belongs_to :user
  has_many :link_subs
  has_many :subs, through: :link_subs, source: :sub

  validates :title, :url, :user_id, presence: true
end
