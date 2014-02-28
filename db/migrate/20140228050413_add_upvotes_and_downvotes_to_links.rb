class AddUpvotesAndDownvotesToLinks < ActiveRecord::Migration
  def change
    add_column :links, :upvote_count, :integer
    add_column :links, :downvote_count, :integer
  end
end
