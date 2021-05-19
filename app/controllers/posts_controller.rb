class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "Succesfully created a post!"
    else
      redirect_to new_post_path, alert: "Post was not saved!"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Current.user.posts.find(params[:id])
    @post.delete
    redirect_to user_path(Current.user)
  end

  private

  def post_params
    params.require(:post).permit(:caption, :post_photo, :user_id)
  end
end
