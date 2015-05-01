class PostsController < ApplicationController

     before_action :is_authenticated?, only: [:new]

  def index
    @posts = Post.all
    @vote = Vote.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
  end

  private

  def post_params

    params.require(:post).permit(:title, :link)
  end


end