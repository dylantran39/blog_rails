class PostsController < ApplicationController
  def create
  end

  def show
    @post = Post.includes(:comments, :user).find params[:id]
    @comment = Comment.new
  end
end
