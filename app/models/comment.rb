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
