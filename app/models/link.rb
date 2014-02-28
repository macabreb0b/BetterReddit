class Link < ActiveRecord::Base
  belongs_to :user
  has_many :link_subs
  has_many :subs, through: :link_subs, source: :sub
  has_many :comments

  validates :title, :url, :user_id, presence: true

  def comments_by_parent_id
    hash = Hash.new { |h, k| h[k] = [] }
    self.comments.each do |comment|
      hash[comment.parent_comment_id] << comment
    end
    hash
  end
end
