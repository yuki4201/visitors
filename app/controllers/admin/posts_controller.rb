class Admin::PostsController < ApplicationController
    
  def index
    @posts = Post.all
    @names = Post.page(params[:page])
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:post][:id])
    @post.update(post_params)
    redirect_to admin_posts_path
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:facility_name, :address, :genre, :review, :url, :breakfast_existence)
  end
  
end