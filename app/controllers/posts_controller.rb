class PostsController < ApplicationController
  before_action :require_login, only: %i[show new create edit update destroy]

  def index
    @posts = Post.all.includes(:user)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to posts_path, success: "created"
    else
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, success: "updated this post"
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path, success: "destroy a post"
  end

  private

  def post_params
    params.require(:post).permit(:body, images: [])
  end
end
