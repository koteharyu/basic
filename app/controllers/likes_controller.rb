class LikesController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.like(@post)
  end

  def destroy
    # @post = Like.find_by(post_id: params[:post_id])
    @post = Like.find(params[:id]).post
    current_user.unlike(@post)
  end
end