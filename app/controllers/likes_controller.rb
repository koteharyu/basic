class LikesController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  def create
    @post = Post.find(params[:post_id])
    if current_user.like(@post) && @post.user.notification_on_like?
      UserMailer.with(user_from: current_user, user_to: @post.user, post: @post).like_post.deliver_later
    end
  end

  def destroy
    # @post = Like.find_by(post_id: params[:post_id])
    @post = Like.find(params[:id]).post
    current_user.unlike(@post)
  end
end
