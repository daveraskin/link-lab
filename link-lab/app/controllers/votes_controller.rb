class VotesController < ApplicationController

  def create

    if params.key?(:comment_id)
      thing = Comment.find_by_id(params[:comment_id])
    elsif params.key?(:post_id)
      thing = Post.find_by_id(params[:post_id])
    else
      render plain: "invalid"
    end

    my_vote = thing.votes.find_by_user_id(current_user.id)
    if my_vote.nil?
    current_user.ballots << thing.votes.create(vote_params)
    redirect_to root_path
    else
      if (params[:vote][:value].to_i != my_vote.value)
        my_vote.value=params[:vote][:value]
        my_vote.save
      else
        flash[:danger] = "You already voted on that"
      end
      redirect_to root_path
    end
  end

  private

    def vote_params
      params.require(:vote).permit(:value)
    end

  end

    # if Post.find(params[:post_id]).votes[0] && current_user.ballots[0]
    #   unless Post.find(params[:post_id]).votes[0]
    # else
    #   current_user.ballots << Post.find(params[:post_id]).votes.create({value: params[:value]})
    #   redirect_to root_path
    # end

  #   if Post.find(params[:post_id]).votes[0] && current_user.ballots[0]
  #     unless current_user.ballots[0].votable_id == Post.find(params[:post_id]).votes[0].votable_id
  #       current_user.ballots << Post.find(params[:post_id]).votes.create({value: params[:value]})
  #     end
  #     redirect_to root_path
  #   else
  #     current_user.ballots << Post.find(params[:post_id]).votes.create({value: params[:value]})
  #     redirect_to root_path
  #   end
  # end
