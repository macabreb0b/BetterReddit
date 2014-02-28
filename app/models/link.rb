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

class Link < ActiveRecord::Base
  belongs_to :user
  has_many :link_subs
  has_many :subs, through: :link_subs, source: :sub
  has_many :comments
  has_many :votes

  validates :title, :url, :user_id, presence: true

  def comments_by_parent_id
    return @hash if @hash
    @hash = Hash.new { |h, k| h[k] = [] }
    self.comments.each do |comment|
      @hash[comment.parent_comment_id] << comment
    end
    @hash
  end

  def score
    self.votes.pluck(:vote).inject(:+) || 0
  end

end
