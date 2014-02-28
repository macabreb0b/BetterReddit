# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  parent_comment_id :integer
#  link_id           :integer
#  body              :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  validates :body, :presence => true

  belongs_to :parent_comment,
    primary_key: :id,
    foreign_key: :parent_comment_id,
    class_name: "Comment"

  has_many :child_comments,
    primary_key: :id,
    foreign_key: :parent_comment_id,
    class_name: "Comment"
end
