class PostsController < ApplicationController

     before_action :is_authenticated?, only: [:new]

  def new

  end

  def create
    @post = Post.create(post_params)
  end

  private

  def post_params

    params.require(:post).permit(:title, :link)
  end


end