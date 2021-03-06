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
    params.require(:post).permit(:image, :facility_name, :address, :genre, :breakfast_existence, :review, :url)
  end
  
end