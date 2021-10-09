class Users::PostsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :show]
    
  def index
    @posts = Post.page(params[:page]).reverse_order
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id #URL入力による投稿編集画面への遷移を防止
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:post][:id])
    @post.update(post_params)
    redirect_to posts_path
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :facility_name, :address, :genre, :breakfast_existence, :review, :url)
  end
  
end