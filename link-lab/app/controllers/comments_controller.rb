class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.where(:post_id => params[:post_id])
    @user = User.all
    @vote = Vote.new
  end

  def new
    @comment = Comment.new
    @comments = Comment.all.where(:post_id => params[:post_id])
    @post = Post.find(params[:post_id])

  end

  def create
    Comment.create({:body => params[:comment][:body], :post_id => params[:post_id], :user_id => current_user.id})
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end