class VotesController < ApplicationController
  def downvote_link
    @link = Link.find(params[:id])
    @vote = current_user.votes.find_by_link_id(@link.id) ||
      Vote.create!(user_id: current_user.id, link_id: @link.id)
    @vote.vote = -1
    @vote.save!

    redirect_to link_url(@link)
  end

  def upvote_link
    @link = Link.find(params[:id])
    @vote = current_user.votes.find_by_link_id(@link.id) ||
      Vote.create!(user_id: current_user.id, link_id: @link.id)
    @vote.vote = 1
    @vote.save!

    redirect_to link_url(@link)
    # render :show
  end

  def unvote_link
    @link = Link.find(params[:id])
    @vote = current_user.votes.find_by_link_id(@link.id)
    @vote.destroy
    redirect_to link_url(@link)
  end
end
